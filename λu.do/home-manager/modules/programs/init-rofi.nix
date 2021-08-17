# programs :: rofi
{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = false;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = ../../assets/configs/rofi/config.rasi;
  };
}
