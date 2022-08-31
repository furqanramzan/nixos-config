{config, ...}: let
  inherit (config.colorscheme) colors;
in {
  programs.tmux = {
    enable = true;
    baseIndex = 1; # Base index for windows and panes.
    keyMode = "vi"; # VI style shortcuts.
    tmuxinator.enable = true;
    extraConfig = ''
      # COLOUR (base16)

      # default statusbar colors
      set-option -g status-style "fg=#${colors.base04},bg=#${colors.base01}"

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
}
