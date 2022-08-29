{
  home.file = {
    ".tmuxp/noc.yaml" = {
      source = ./tmuxp.yaml;
    };
    ".tmuxp/noc.sh" = {
      source = ./bootstrap.sh;
      executable = true;
    };
  };
}
