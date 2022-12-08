{configs, ...}: let
  inherit (configs) name email;
in {
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user = {
        inherit name;
        inherit email;
      };
      pull.rebase = false;
    };
  };
}
