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
    }) 
    {
      home-configurations = {
        # for darwin
        home-manager-lib = inputs.home-manager.lib.homeManagerConfiguration;
        macos-book = home-manager-lib {
          configuration = { config, pkgs, ... }:{
            nixpkgs.overlays = verlays;
            nixpkgs.config = import ./config.nix;
            xdg.configFile."nix/nix.conf".source = ./assets/configs/nix-mirror.conf;
            imports = [
                ./home.nix
                ./source.nix
                ./programs/init-zsh.nix
                ./programs/init-fzf.nix
                ./programs/init-emacs.nix
                ./programs/init-zoxide.nix
                ./programs/init-alacritty.nix
            ];
          };
          system = "x86_64-darwin";
          homeDirectory = "/Users/apple";
          username = "apple";
        };

        # for nixos
        nixos-book = home-manager-lib {
          configuration = { config, pkgs, ... }: {
            nixpkgs.overlays = overlays;
            nixpkgs.config = import ./config.nix;
            xdg.configFile."nix/nix.conf".source = ./assets/configs/nix-mirror.conf;
            imports = [
              ./home.nix
            ];
          };
          system = "x86_64-linux";
          homeDirectory = "/home/aylax";
          username = "aylax";
       };
     };

     macos-book = self.home-configurations.macos-book.activationPackage;
     nixos-book = self.home-configurations.nixos-book.activationPackage;
   };
}
