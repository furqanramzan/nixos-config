{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.nodePackages.pnpm];

  home = {
    sessionPath = ["$HOME/.pnpm"];
    sessionVariables = {PNPM_HOME = "$HOME/.pnpm";};
  };
}
