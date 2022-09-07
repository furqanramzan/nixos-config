{config, ...}: let
  project = {
    name = "nixosconfig";
    shortName = "noc";
    codeDir = "code";
    repository_url = "git@gitlab.com:furqanpersonal/nixos-config.git";
  };
  inherit (config.xdg) configHome;
  inherit (config.home) homeDirectory;
in {
  xdg.configFile = {
    "tmuxinator/${project.shortName}.yml" = {
      text = ''
        # ${configHome}/tmuxinator/${project.shortName}.yml

        name: ${project.shortName}
        root: <%= ENV["XDG_PROJECTS_DIR"] %>/${project.name}/${project.codeDir}

        on_project_start: ${homeDirectory}/data/projects/${project.name}/bootstrap.sh

        windows:
          - editor: $EDITOR .
          - server: nixos-rebuild build --flake .#config
      '';
    };
  };
  home.file."data/projects/${project.name}/bootstrap.sh" = {
    text = ''
      ${builtins.readFile ./common.sh}

      repository_url="${project.repository_url}"
      initialize() {
        clone $repository_url
        cd $code_dir
        nixos-rebuild build --flake .#config
        cd -
      }

      ${builtins.readFile ./project.sh}
    '';
    executable = true;
  };
}
