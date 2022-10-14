{pkgs, ...}: {
  home.packages = with pkgs; [
    google-chrome
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

    sqlitebrowser
    drawio
    insomnia
    postman
    sublime-merge
    dbeaver

    # mpv
    # pavucontrol # Audio Control
    cmus # Command line audio player

    # slack
    # skypeforlinux
  ];
}
