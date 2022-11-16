{config, ...}: let
  inherit (config.colorscheme) colors;
  inherit (config.xdg) configHome;
in {
  programs.tmux = {
    enable = true;
    baseIndex = 1; # Base index for windows and panes.
    keyMode = "vi"; # VI style shortcuts.
    # Automatically spawn a session if trying to attach and none are running.
    newSession = true;
    tmuxinator.enable = true;
    terminal = "screen-256color";
    escapeTime = 0;
    extraConfig = ''
      # Enable mouse
      setw -g mouse on

      # COLOUR (base16)
      set-option -sa terminal-overrides ',alacritty:RGB'

      # default statusbar colors
      set-option -g status-style "fg=#${colors.base04},bg=#${colors.base02}"

      # default window title colors
      set-window-option -g window-status-style "fg=#${colors.base04},bg=default"

      # active window title colors
      set-window-option -g window-status-current-style "fg=#${colors.base0A},bg=default"

      # pane border
      set-option -g pane-border-style "fg=#${colors.base01}"
      set-option -g pane-active-border-style "fg=#${colors.base02}"

      # message text
      set-option -g message-style "fg=#${colors.base05},bg=#${colors.base01}"

      # pane number display
      set-option -g display-panes-active-colour "#${colors.base0B}"
      set-option -g display-panes-colour "#${colors.base0A}"

      # clock
      set-window-option -g clock-mode-colour "#${colors.base0B}"

      # copy mode highligh
      set-window-option -g mode-style "fg=#${colors.base04},bg=#${colors.base02}"

      # bell
      set-window-option -g window-status-bell-style "fg=#${colors.base01},bg=#${colors.base08}"
    '';
  };
  xdg.configFile = {
    "tmuxinator/main.yml" = {
      text = ''
        # ${configHome}/tmuxinator/main.yml

        name: main
        root: ~

        windows:
          - command:
      '';
    };
  };
  home.file."${config.colorscheme.slug}.css" = {
    text = ''
      .base00 { color: "#${config.colorscheme.colors.base00}";}
      .base01 { color: "#${config.colorscheme.colors.base01}";}
      .base02 { color: "#${config.colorscheme.colors.base02}";}
      .base03 { color: "#${config.colorscheme.colors.base03}";}
      .base04 { color: "#${config.colorscheme.colors.base04}";}
      .base05 { color: "#${config.colorscheme.colors.base05}";}
      .base06 { color: "#${config.colorscheme.colors.base06}";}
      .base07 { color: "#${config.colorscheme.colors.base07}";}
      .base08 { color: "#${config.colorscheme.colors.base08}";}
      .base09 { color: "#${config.colorscheme.colors.base09}";}
      .base0A { color: "#${config.colorscheme.colors.base0A}";}
      .base0B { color: "#${config.colorscheme.colors.base0B}";}
      .base0C { color: "#${config.colorscheme.colors.base0C}";}
      .base0D { color: "#${config.colorscheme.colors.base0D}";}
      .base0E { color: "#${config.colorscheme.colors.base0E}";}
      .base0F { color: "#${config.colorscheme.colors.base0F}";}
    '';
  };
}
