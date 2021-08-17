# home :: flake
{ 
  description = "support non nixos system";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.emacs-overlay = {
    type = "github";
    owner = "mjlbach";
    repo = "emacs-overlay";
    ref = "feature/flakes";
  };

  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs.LS_COLORS = {
    url = "github:trapd00r/LS_COLORS";
    flake = false;
  };

  outputs = { self, ... }@inputs:
    let
      overlays = [
        inputs.emacs-overlay.overlay
        (final: prev: { LS_COLORS = inputs.LS_COLORS; })
      ];
    in
    inputs.flake-utils.lib.eachDefaultSystem (system: {
      legacyPackages = inputs.nixpkgs.legacyPackages.${system};
    }) // {
      homeConfigurations = {
        # for darwin
        macos-book = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { config, pkgs, ... }:
	  {
            nixpkgs.overlays = overlays;
            nixpkgs.config = import ./modules/config.nix;
            xdg.configFile."nix/nix.conf".source = ./assets/configs/nix-mirror.conf;
            imports = [
                ./modules/source.nix
                ./modules/home-manager.nix
                # ./modules/programs/init-zsh.nix
                # ./modules/programs/init-fzf.nix
                # ./modules/programs/init-emacs.nix
                # ./modules/programs/init-zoxide.nix
                # ./modules/programs/init-alacritty.nix
            ];
          };
          system = "x86_64-darwin";
          homeDirectory = "/Users/apple";
          username = "apple";
        };

        # for nixos
        nixos-book = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { config, pkgs, ... }:
	  {
            nixpkgs.overlays = overlays;
            nixpkgs.config = import ./modules/config.nix;
            xdg.configFile."nix/nix.conf".source = ./assets/configs/nix-mirror.conf;
            imports = [
	      ./mudules/source.nix
              ./modules/home-manager.nix
            ];
          };
          system = "x86_64-linux";
          homeDirectory = "/home/aylax";
          username = "aylax";
       };
     };

     macos-book = self.homeConfigurations.macos-book.activationPackage;
     nixos-book = self.homeConfigurations.nixos-book.activationPackage;
   };
}
