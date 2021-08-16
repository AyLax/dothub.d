# programs :: alacritty
# Ref: https://github.com/alacritty/alacritty/blob/master/alacritty.yml
{ fontSize, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 25;
          y = 25;
          dynamic_padding = true;
          decoration = "none";
        };
      };
      font = {
        size = 16.0;
      };
      colors = {
        primary = {
          background = "0x181a20";
          foreground = "0xeeffff";
        };
        
        cursor = {
          text   = "0x111111";
          cursor = "0xff2800";
        };

        vi_mode_cursor = {
          text   = "0x111111";
          cursor = "0xff2800";
        };

        normal = {
          black   = "0x212121";
          red     = "0xf07178";
          green   = "0xc3e88d";
          yellow  = "0xffcb6b";
          blue    = "0x82aaff";
          magenta = "0xc792ea";
          cyan    = "0x89ddff";
          white   = "0xeeffff";
        };

        bright = {
          black   = "0x4a4a4a";
          red     = "0xf07178";
          green   = "0xc3e88d";
          yellow  = "0xffcb6b";
          blue    = "0x82aaff";
          magenta = "0xc792ea";
          cyan    = "0x89ddff";
          white   = "0xffffff";
        };
      };

      bell = {
        animation = "EaseOutExpo";
        duration = 0;
        color = "#ffffff";
      };

      background_opacity = 1;
      live_config_reload = true;

      selection = {
        save_to_clipboard = true;
      };

      cursor = {
        style.shape = "Block";
        style.blinking = "Always";
        blink_interval = 480;
      };
    };
  };
}
