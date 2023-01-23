{config, ...}: let
  project = {
    name = "nx";
    shortName = "nnx";
    codeDir = "code";
    repository_url = "git@gitlab.com:muhammad.furqan2/nx.git";
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
          - server:
          - command:
      '';
    };
  };
  home.file."data/projects/${project.name}/bootstrap.sh" = {
    text = ''
      ${builtins.readFile ./common.sh}

      repository_url="${project.repository_url}"
      database_name="${project.name}"
      initialize() {
        clone $repository_url
        install pnpm
        cd $code_dir
        git config --local user.email "muhammad.furqan@cooperativecomputing.com"
        cd -
      }

      ${builtins.readFile ./project.sh}
    '';
    executable = true;
  };
}
