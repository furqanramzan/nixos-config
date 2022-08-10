{ pkgs }:

let nixTools = with pkgs; [
  google-chrome
  anydesk
  libreoffice
  transmission

  easytag
  audacity-gtk3

  sqlitebrowser
  drawio
  insomnia
  postman

  vlc
  mpv
  pavucontrol # Audio Control

  slack
  skypeforlinux
];
in nixTools
