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
      documents = "$HOME/documents";
      download = "$HOME/download";
      music = "$HOME/music";
      pictures = "$HOME/pictures";
      templates = "$HOME/templates";
      videos = "$HOME/videos";
      publicShare = "$HOME/public";
      extraConfig = {
        XDG_MISC_DIR = "$HOME/misc";
        XDG_PROJECTS_DIR = "$HOME/projects";
      };
    };
  };
}
