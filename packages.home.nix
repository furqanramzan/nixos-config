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

  slack
  skypeforlinux
];
in nixTools
