# programs :: alacritty
# Ref: https://github.com/alacritty/alacritty/blob/master/alacritty.yml
{ fontSize, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      colors = {
        primary = {
          background = "#2b2836";
          foreground = "#ffffff";
        };

        cursor = {
          text = "#111111";
          cursor = "#ff2800";
        };

        vi_mode_cursor = {
          text = "#111111";
          cursor = "#ff2800";
        };

        search = {
          matches = {
            foreground = "#000000";
            background = "#fffacd";
          };

          focused_match = {
            foreground = "#fffacd";
            background = "#000000";
          };

          bar = {
            foreground = "#c5c8c6";
            background = "#1d1f21";
          };
        };

        hints = {
          start = {
            foreground = "#1d1f21";
            background = "#e9ff5e";
          };

          end = {
            foreground = "#e9ff5e";
            background = "#1d1f21";
          };
        };

        selection = {
          text = "#000000";
          background = "#fffacd";
        };

        normal = {
          black   = "#2b2836";
          red     = "#f36a66";
          green   = "#84fba2";
          yellow  = "#f3e4a2";
          blue    = "#93b4ff";
          magenta = "#bd93f9";
          cyan    = "#ffb793";
          white   = "#fdf6e3";
        };

        bright = {
          black   = "#2b2836";
          red     = "#f36a66";
          green   = "#84fba2";
          yellow  = "#f3e4a2";
          blue    = "#93b4ff";
          magenta = "#bd93f9";
          cyan    = "#ffb793";
          white   = "#fdf6e3";
        };
      };

      bell = {
        animation = EaseOutExpo;
        duration = 0;
        color = "#ffffff";
      };

      background_opacity = 0.64;

      selection = {
        semantic_escape_chars: ",│`|:\"' ()[]{}<>\t";
        save_to_clipboard: true;
      };

      cursor = {
        style.shape = Block;
        style.blinking = Always;
        blink_interval = 480;
      };
    };
  };
}
