{name, email, ...}:

{
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "master";
      };
      user = {
        name = name;
        email = email;
      };
      pull.rebase = false;
    };
  };
}
