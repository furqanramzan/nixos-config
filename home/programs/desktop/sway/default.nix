{pkgs, ...}: {
  imports = [
    ./waybar.nix
    ./lock.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemdIntegration = true; # Enable sway-session.target to link to graphical-session.target for systemd
    config = rec {
      # Sway configuration
      modifier = "Mod4";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.rofi}/bin/rofi -show drun";
      workspaceOutputAssign = [
        {
          output = "eDP-1";
          workspace = "1";
        }
        {
          output = "HDMI-A-2";
          workspace = "2";
        }
        {
          output = "HDMI-A-2";
          workspace = "3";
        }
        {
          output = "HDMI-A-2";
          workspace = "4";
        }
        {
          output = "HDMI-A-2";
          workspace = "5";
        }
        {
          output = "HDMI-A-2";
          workspace = "6";
        }
        {
          output = "HDMI-A-2";
          workspace = "7";
        }
        {
          output = "HDMI-A-2";
          workspace = "8";
        }
        {
          output = "HDMI-A-2";
          workspace = "9";
        }
      ];
      startup = [
        # Run commands on Sway startup
        {
          command = "${pkgs.autotiling}/bin/autotiling";
          always = true;
        } # Tiling Script
        ##{command = ''
        ##  ${pkgs.swayidle}/bin/swayidle -w \
        ##      before-sleep '${pkgs.swaylock-fancy}/bin/swaylock-fancy'
        ##''; always = true;}                             # Lock on lid close (currently disabled because using laptop as temporary server)
        #{command = ''
        #  ${pkgs.swayidle}/bin/swayidle \
        #    timeout 120 '${pkgs.swaylock-fancy}/bin/swaylock-fancy' \
        #    timeout 240 'swaymsg "output * dpms off"' \
        #    resume 'swaymsg "output * dpms on"' \
        #    before-sleep '${pkgs.swaylock-fancy}/bin/swaylock-fancy'
        #''; always = true;}                            # Auto lock\
      ];

      bars = [
        {
          command = "waybar";
        }
      ];
      colors.focused = {
        background = "#999999";
        border = "#999999";
        childBorder = "#999999";
        indicator = "#212121";
        text = "#999999";
      };

      keybindings = {
        # Hotkeys
        "${modifier}+Escape" = "exec swaymsg exit"; # Exit Sway
        "${modifier}+Return" = "exec ${terminal}"; # Open terminal
        "${modifier}+space" = "exec ${menu}"; # Open menu
        "${modifier}+l" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy"; # Lock Screen

        "${modifier}+r" = "reload"; # Reload environment
        "${modifier}+q" = "kill"; # Kill container
        "${modifier}+f" = "fullscreen toggle"; # Fullscreen
        "${modifier}+h" = "floating toggle"; # Floating

        "${modifier}+Left" = "focus left"; # Focus container in workspace
        "${modifier}+Right" = "focus right";
        "${modifier}+Up" = "focus up";
        "${modifier}+Down" = "focus down";

        "${modifier}+Shift+Left" = "move left"; # Move container in workspace
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Down" = "move down";

        #"${modifier}+Left" = "workspace prev";                  # Navigate to previous or next workspace if it exists
        #"${modifier}+Right" = "workspace next";
        # "${modifier}+Left" = "workspace prev_on_output"; # Navigate to previous or next workspace on output if it exists
        # "${modifier}+Right" = "workspace next_on_output";

        "${modifier}+1" = "workspace number 1"; # Open workspace x
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";

        # "${modifier}+Shift+Left" = "move container to workspace prev, workspace prev"; # Move container to next available workspace and focus
        # "${modifier}+Shift+Right" = "move container to workspace next, workspace next";

        "${modifier}+Shift+1" = "move container to workspace number 1"; # Move container to specific workspace
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";

        "${modifier}+Alt+Up" = "resize shrink height 20px"; # Resize container
        "${modifier}+Alt+Down" = "resize grow height 20px";
        "${modifier}+Alt+Left" = "resize shrink width 20px";
        "${modifier}+Alt+Right" = "resize grow width 20px";

        "Print" = "exec ${pkgs.flameshot}/bin/flameshot gui"; # Screenshots

        "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 10"; #Volume control
        "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 10";
        "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t"; #Media control
        "XF86AudioMicMute" = "exec ${pkgs.pamixer}/bin/pamixer --default-source -t";
        #"XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        #"XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        #"XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        #
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s +2%";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 2%-"; # Display brightness control
      };
    };
    extraConfig = ''
      set $opacity 0.8
      for_window [class=".*"] opacity 0.95
      for_window [app_id=".*"] opacity 0.95
      for_window [app_id="pavucontrol"] floating enable, sticky
      for_window [app_id=".blueman-manager-wrapped"] floating enable
      for_window [title="Picture in picture"] floating enable, move position 1205 634, resize set 700 400, sticky enable
    ''; # $ swaymsg -t get_tree or get_outputs
    extraSessionCommands = ''
      #export WLR_NO_HARDWARE_CURSORS="1";  # Needed for cursor in vm
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=sway
      export XDG_CURRENT_DESKTOP=sway
    '';
  };
}
