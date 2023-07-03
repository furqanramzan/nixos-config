{config, ...}: let
  project = {
    name = "sveltekitecommerce";
    shortName = "sec";
    codeDir = "code";
    repository_url = "git@github.com:furqanramzan/sveltekit-ecommerce.git";
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
        cp .env.example .env
        install pnpm
        git config core.hooksPath .githooks
      }

      ${builtins.readFile ./project.sh}
    '';
    executable = true;
  };
}
