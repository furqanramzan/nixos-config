{
  config,
  pkgs,
  ...
}: let
  inherit (config.colorscheme) colors;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        family = "Ubuntu";
        size = 6;
      };
      colors = {
        primary = {
          background = "#${colors.base00}";
          foreground = "#${colors.base06}";
          bright_foreground = "#${colors.base07}";
        };
        cursor = {
          text = "#${colors.base00}";
          cursor = "#${colors.base06}";
        };
        vi_mode_cursor = {
          text = "#${colors.base00}";
          cursor = "#${colors.base06}";
        };
        search = {
          matches = {
            foreground = "#${colors.base02}";
            background = "#${colors.base0A}";
          };
          focused_match = {
            foreground = "#${colors.base02}";
            background = "#${colors.base0B}";
          };
        };
        footer_bar = {
          background = "#${colors.base00}";
          foreground = "#${colors.base06}";
        };
        hints = {
          start = {
            foreground = "#${colors.base00}";
            background = "#${colors.base0B}";
          };
          end = {
            foreground = "#${colors.base0B}";
            background = "#${colors.base00}";
          };
        };
        selection = {
          text = "#${colors.base06}";
          background = "#${colors.base02}";
        };
        normal = {
          black = "#${colors.base01}";
          red = "#${colors.base08}";
          green = "#${colors.base0A}";
          yellow = "#${colors.base0B}";
          blue = "#${colors.base0E}";
          magenta = "#${colors.base08}";
          cyan = "#${colors.base0D}";
          white = "#${colors.base06}";
        };
        bright = {
          black = "#${colors.base03}";
          red = "#${colors.base08}";
          green = "#${colors.base0A}";
          yellow = "#${colors.base0B}";
          blue = "#${colors.base0E}";
          magenta = "#${colors.base08}";
          cyan = "#${colors.base0D}";
          white = "#${colors.base07}";
        };
      };
    };
  };
}
