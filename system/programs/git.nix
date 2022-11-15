{
  name,
  email,
  ...
}: {
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "master";
      };
      user = {
        inherit name;
        inherit email;
      };
      pull.rebase = false;
    };
  };
}
