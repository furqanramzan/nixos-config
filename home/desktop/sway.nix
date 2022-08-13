{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    systemdIntegration = true; # Enable sway-session.target to link to graphical-session.target for systemd
    config = rec {
      # Sway configuration
      modifier = "Mod4";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.rofi}/bin/rofi -show drun";

      startup = [
        # Run commands on Sway startup
        { command = "${pkgs.autotiling}/bin/autotiling"; always = true; } # Tiling Script
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

      bars = [{
        command = "waybar";
      }];
    };
  };
}
