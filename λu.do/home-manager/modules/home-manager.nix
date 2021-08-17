{ config, pkgs, libs, ... }:

{
  programs.home-manager.enable = true;

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  home.sessionVariables = {
    # NIX_PATH = "nixpkgs=$HOME/dothub.d/λu.do/home-manager/compat";
  };

  home.stateVersion = "21.11";
}
