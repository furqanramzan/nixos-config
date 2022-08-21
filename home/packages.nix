{ pkgs, ... }:

{
  home.packages = with pkgs; [
    google-chrome
    vivaldi
    opera
    transmission-qt

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

    mpv
    pavucontrol # Audio Control
    cmus # Command line audio player

    slack
    skypeforlinux
  ];
}
