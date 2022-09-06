{config, ...}: let
  project = {
    name = "bleufox";
    shortName = "bfx";
    codeDir = "code";
    repository_url = "git@bitbucket.org:cooperativecomputing/bleu-fox.git";
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
          - server: pnpm dev
          - command:
      '';
    };
  };
  home.file."data/projects/${project.name}/bootstrap.sh" = {
    text = ''
      ${builtins.readFile ../common.sh}

      repository_url="${project.repository_url}"
      database_name="${project.name}"
      initialize() {
        clone $repository_url
        install pnpm
        database $database_name "create"
        cd $code_dir
        git config --local user.email "muhammad.furqan@cooperativecomputing.com"
        cp .env.example .env
        pnpm migrate
        pnpm seed
        cd -
      }

      ${builtins.readFile ../project.sh}
    '';
    executable = true;
  };
}
