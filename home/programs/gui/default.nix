{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ./chromium.nix
    ./vlc
    ./xdg.nix
    ./gtk.nix
    ./font.nix
  ];
  home.packages = with pkgs; [
    mongodb-compass
    google-chrome
    microsoft-edge-beta
    opera
    bleachbit
    # vivaldi
    # opera
    transmission-qt

    # anydesk
    # teamviewer

    libreoffice
    # calibre

    # blender
    gimp
    # kdenlive
    # inkscape
    # handbrake

    easytag
    audacity

    # mpv
    # pavucontrol # Audio Control
    cmus # Command line audio player
    simplescreenrecorder
    libsForQt5.filelight
  ];
}
