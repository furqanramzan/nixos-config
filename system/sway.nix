{ config, pkgs, lib, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      autotiling
      rofi
      light
      waybar
      xwayland
      mako # notification daemon
      alacritty # gpu accelerated terminal
      wayland
      glib # gsettings
      dracula-theme # gtk theme
      swaylock # lock screen
      swayidle # idle management daemon
      grim # screenshot functionality
      slurp # screenshot functionality
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      wf-recorder # video capture tool
      bemenu # wayland clone of dmenu
      mako # notification system developed by swaywm maintainer
      wlsunset # Day/night gamma adjustments
    ];
  };
}
