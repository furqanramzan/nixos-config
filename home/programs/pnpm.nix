{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.unstable.nodePackages_latest.pnpm];

  home = {
    sessionPath = ["$HOME/.pnpm"];
    sessionVariables = {PNPM_HOME = "$HOME/.pnpm";};
  };
}
