{pkgs, ...}: {
  home.packages = [pkgs.nodePackages_latest.pnpm];

  home = {
    sessionPath = ["$HOME/.pnpm"];
    sessionVariables = {PNPM_HOME = "$HOME/.pnpm";};
  };
}
