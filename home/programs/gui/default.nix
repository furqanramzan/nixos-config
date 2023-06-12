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
    xcolor
    mongodb-compass
    google-chrome
    microsoft-edge-beta
    opera
    bleachbit
    # vivaldi
    # opera
    transmission-qt
    skypeforlinux

    # anydesk
    # teamviewer

    libreoffice
    libsForQt5.kate
    # calibre

    # blender
    gimp
    # kdenlive
    # inkscape
    # handbrake
    kget

    easytag
    audacity

    # mpv
    # pavucontrol # Audio Control
    cmus # Command line audio player
    simplescreenrecorder
    libsForQt5.filelight
  ];
}
