{pkgs, ...}: {
  home.packages = [pkgs.vlc];
  home.file = {
    ".config/vlc/vlcrc" = {
      source = ./vlcrc;
    };
  };
}
