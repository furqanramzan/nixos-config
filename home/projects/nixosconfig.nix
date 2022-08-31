{config, ...}: let
  project = {
    name = "nixosconfig";
    shortName = "noc";
    codeDir = "code";
    repo = "git@gitlab.com:furqanpersonal/nixos-config.git";
  };
  inherit (config.xdg) configHome;
in {
  xdg.configFile = {
    "tmuxinator/${project.shortName}.yml" = {
      text = ''
        # ${configHome}/tmuxinator/${project.shortName}.yml

        name: ${project.shortName}
        root: <%= ENV["XDG_PROJECTS_DIR"] %>/${project.name}/${project.codeDir}

        on_project_start: ${configHome}/projects/${project.shortName}.sh

        windows:
          - editor: $EDITOR .
          - server: nixos-rebuild build --flake .#config
      '';
    };
    "projects/${project.shortName}.sh" = {
      text = ''
        #!/usr/bin/env bash

        project_directory="${project.name}"
        repository_directory="${project.codeDir}"

        # Absolute path to project directory
        project_path="$HOME/projects/$project_directory"
        repository_path="$project_path/$repository_directory"
        # If directory not exists
        if [ ! -d "$repository_path" ]; then
          git clone ${project.repo} $repository_path
          cd $repository_path
          cd -
        fi
        exit 0
      '';
      executable = true;
    };
  };
}
