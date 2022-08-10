{ pkgs }:

let nixTools = with pkgs; [
  google-chrome
  vivaldi
  opera
  transmission

  anydesk
  teamviewer

  libreoffice
  calibre

  blender
  gimp
  kdenlive
  inkscape
  handbrake

  easytag
  audacity-gtk3

  sqlitebrowser
  drawio
  insomnia
  postman
  vscode

  vlc
  mpv
  pavucontrol # Audio Control
  cmus # Command line audio player

  slack
  skypeforlinux
];
in nixTools
