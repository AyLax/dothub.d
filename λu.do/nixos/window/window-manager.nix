{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    libinput.enable = true;

    displayManager.sddm = {
      enable = true;
      };
    };

    xkbOptions = "terminate:ctrl_alt_bksp,caps:ctrl_modifier";
    desktopManager.plasma5.enable = true;

  };

  i18n.inputMethod = {
    enabled = "fcitx";
    fcitx.engines = with pkgs.fcitx-engines; [ libpinyin rime mozc ];
  };
}
