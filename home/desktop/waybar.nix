{ pkgs, config, ... }:
{
  programs.waybar = {
    enable = true;

    # Cheatsheet:
    # x -> all sides
    # x y -> vertical, horizontal
    # x y z -> top, horizontal, bottom
    # w x y z -> top, right, bottom, left
    style =
      let inherit (config.colorscheme) colors; in
      ''
        * {
          font-family: FiraCode Nerd Font Mono;
          font-size: 12pt;
          padding: 0 8px;
        }

        .modules-right {
          margin-right: -15;
        }

        .modules-left {
          margin-left: -15;
        }

        window#waybar.top {
          color: #${colors.base05};
          opacity: 0.95;
          background-color: #${colors.base00};
          border: 2px solid #${colors.base0C};
          padding: 0;
          border-radius: 10px;
        }
        window#waybar.bottom {
          color: #${colors.base05};
          background-color: #${colors.base00};
          border: 2px solid #${colors.base0C};
          opacity: 0.90;
          border-radius: 10px;
        }

        #workspaces button {
          background-color: #${colors.base01};
          color: #${colors.base05};
          margin: 4px;
        }
        #workspaces button.hidden {
          background-color: #${colors.base00};
          color: #${colors.base04};
        }
        #workspaces button.focused,
        #workspaces button.active {
          background-color: #${colors.base0A};
          color: #${colors.base00};
        }

        #clock {
          background-color: #${colors.base0C};
          color: #${colors.base00};
          padding-left: 15px;
          padding-right: 15px;
          margin-top: 0;
          margin-bottom: 0;
          border-radius: 10px;
        }

        #custom-menu {
          background-color: #${colors.base0C};
          color: #${colors.base00};
          padding-left: 15px;
          padding-right: 22px;
          margin-left: 0;
          margin-right: 10px;
          margin-top: 0;
          margin-bottom: 0;
          border-radius: 10px;
        }
        #custom-hostname {
          background-color: #${colors.base0C};
          color: #${colors.base00};
          padding-left: 15px;
          padding-right: 18px;
          margin-right: 0;
          margin-top: 0;
          margin-bottom: 0;
          border-radius: 10px;
        }
      '';
    settings = [{
      layer = "bottom";
      position = "top";
      height = 16;
      # output = [
      #   #"eDP-1"
      #   "DP-2"
      #   "HDMI-A-2"
      # ];
      tray = { spacing = 10; };
      modules-center = [ "clock" ];
      modules-left = [ "sway/workspaces" "sway/window" "sway/mode" ];
      #modules-left = [ "wlr/workspaces" ];
      modules-right = [ "cpu" "memory" "disk" "pulseaudio" "battery" "network" "tray" ];
      # modules-right = [ "cpu" "memory" "pulseaudio" "clock" "tray" ];

      "sway/workspaces" = {
        format = "<span font='12'>{icon}</span>";
        format-icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "";
        };
        all-outputs = true;
        persistent_workspaces = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
          "5" = [ ];
        };
      };
      "wlr/workspaces" = {
        format = "<span font='12'>{icon}</span>";
        format-icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "";
        };
        all-outputs = true;
        active-only = false;
        on-click = "activate";
      };
      clock = {
        format = "{:%b %d %H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%A, %B %d, %Y} ";
      };
      cpu = {
        format = "{usage}% <span font='11'></span>";
        tooltip = false;
        interval = 1;
      };
      disk = {
        format = "{percentage_used}% <span font='11'></span>";
        path = "/";
        interval = 30;
      };
      memory = {
        format = "{}% <span font='11'></span>";
        interval = 1;
      };
      battery = {
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% <span font='11'>{icon}</span>";
        format-charging = "{capacity}% <span font='11'></span>";
        format-icons = [ "" "" "" "" "" ];
        max-length = 25;
      };
      network = {
        format-wifi = "<span font='11'></span>";
        format-ethernet = "<span font='11'></span> {ifname}: {ipaddr}/{cidr}";
        format-linked = "<span font='11'>睊</span> {ifname} (No IP)";
        format-disconnected = "<span font='11'>睊</span> Not connected";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        tooltip-format = "{essid} {signalStrength}%";
        on-click-right = "${pkgs.alacritty}/bin/alacritty -e nmtui";
      };
      pulseaudio = {
        format = "<span font='11'>{icon}</span> {volume}% {format_source}";
        format-bluetooth = "<span font='11'>{icon}</span> {volume}% {format_source}";
        format-bluetooth-muted = "<span font='11'></span> {volume}% {format_source}";
        format-muted = "<span font='11'></span> {format_source}";
        #format-source = "{volume}% <span font='11'></span>";
        format-source = "<span font='11'></span>";
        format-source-muted = "<span font='11'></span>";
        format-icons = {
          default = [ "" "" "" ];
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
        };
        tooltip-format = "{desc}, {volume}%";
        on-click = "${pkgs.pamixer}/bin/pamixer -t";
        on-click-right = "${pkgs.pamixer}/bin/pamixer --default-source -t";
        on-click-middle = "${pkgs.pavucontrol}/bin/pavucontrol";
      };
      tray = {
        icon-size = 11;
      };
    }];
  };
}
