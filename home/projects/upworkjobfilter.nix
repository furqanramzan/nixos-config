{config, ...}: let
  project = {
    name = "upworkjobfilter";
    shortName = "ujf";
    codeDir = "code";
    repository_url = "git@github.com:furqanramzan/upwork-job-filter.git";
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
          - server: pnpm run dev
          - command:
          - production: cd ../production
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
        echo "use flake" >> .envrc
        direnv allow .
        eval "$(direnv export bash)"
        cp .env.example .env
        install pnpm
        pnpm run push
        pnpm nuxt prepare
        git config core.hooksPath .githooks

        # production
        cd ../
        clone $repository_url production
        cd production
        echo "use flake" >> .envrc
        direnv allow .
        eval "$(direnv export bash)"
        cp .env.example .env
        install pnpm
        pnpm run push
        pnpm nuxt prepare
        git config core.hooksPath .githooks
      }

      ${builtins.readFile ./project.sh}
    '';
    executable = true;
  };
}
