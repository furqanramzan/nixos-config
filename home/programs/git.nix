{
  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      ci = "commit";
      cia = "commit --amend";
      cin = "commit --no-verify";
      cian = "commit --amend --no-verify";
      s = "status";
      b = "branch";
      ph = "push";
      pl = "pull";
    };
  };
}
