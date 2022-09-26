{
  config,
  pkgs,
  lib,
  ...
}: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "$HOME/desktop";
      publicShare = "$HOME/public";
      templates = "$HOME/templates";
      music = "$HOME/data/music";
      videos = "$HOME/data/videos";
      pictures = "$HOME/data/pictures";
      download = "$HOME/data/download";
      documents = "$HOME/data/documents";
      extraConfig = {
        XDG_MISC_DIR = "$HOME/data/misc";
        XDG_NAATS_DIR = "$HOME/data/naats";
        XDG_SONGS_DIR = "$HOME/data/songs";
        XDG_PROJECTS_DIR = "$HOME/data/projects";
      };
    };
  };
}
