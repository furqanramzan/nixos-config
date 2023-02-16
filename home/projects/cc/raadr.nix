{config, ...}: let
  server = {
    name = "raadrbe";
    shortName = "rrb";
    codeDir = "code";
    repository_url = "git@bitbucket.org:cooperativecomputing/jd-raadr-be.git";
  };
  web = {
    name = "raadrfe";
    shortName = "rrf";
    codeDir = "code";
    repository_url = "git@bitbucket.org:cooperativecomputing/jd-raadr-fe.git";
  };
  inherit (config.xdg) configHome;
  inherit (config.home) homeDirectory;
in {
  xdg.configFile = {
    "tmuxinator/${server.shortName}.yml" = {
      text = ''
        # ${configHome}/tmuxinator/${server.shortName}.yml

        name: ${server.shortName}
        root: <%= ENV["XDG_PROJECTS_DIR"] %>/${server.name}/${server.codeDir}

        on_project_start: ${homeDirectory}/data/projects/${server.name}/bootstrap.sh

        windows:
          - editor: $EDITOR .
          - server: pnpm start:dev
          - command:
      '';
    };
    "tmuxinator/${web.shortName}.yml" = {
      text = ''
        # ${configHome}/tmuxinator/${web.shortName}.yml

        name: ${web.shortName}
        root: <%= ENV["XDG_PROJECTS_DIR"] %>/${web.name}/${web.codeDir}

        on_project_start: ${homeDirectory}/data/projects/${web.name}/bootstrap.sh

        windows:
          - editor: $EDITOR .
          - server: pnpm dev
          - command:
      '';
    };
  };
  home.file = {
    "data/projects/${server.name}/bootstrap.sh" = {
      text = ''
        ${builtins.readFile ../common.sh}

        repository_url="${server.repository_url}"
        database_name="${server.name}"

        initialize() {
          clone $repository_url
          install pnpm
          database $database_name "create"
          cd $code_dir
          git config --local user.email "muhammad.furqan@cooperativecomputing.com"
          cp .env.example .env
          pnpm migration:run
          pnpm seed:run
          cd -
        }

        ${builtins.readFile ../project.sh}
      '';
      executable = true;
    };
    "data/projects/${web.name}/bootstrap.sh" = {
      text = ''
        ${builtins.readFile ../common.sh}

        repository_url="${web.repository_url}"
        repository_directory="${web.name}"

        initialize() {
          clone $repository_url
          install pnpm
          cd $code_dir
          git config --local user.email "muhammad.furqan@cooperativecomputing.com"
          cd -
        }

        ${builtins.readFile ../project.sh}
      '';
      executable = true;
    };
  };
}
