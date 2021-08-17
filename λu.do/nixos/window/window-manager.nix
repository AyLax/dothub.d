{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    libinput.enable = true;

    displayManager.sddm = {
      enable = true;
    };

    desktopManager.plasma5.enable = true;

  };
}
