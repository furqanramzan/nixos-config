{pkgs, ...}: {
  home.packages = [pkgs.nodePackages_latest.pnpm];

  home = {
    sessionPath = ["$HOME/.pnpm"];
    sessionVariables = {PNPM_HOME = "$HOME/.pnpm";};
    # Packages from nodePackages_latest don't result in executables in $PATH
    # Temporary fix
    file = {
      ".local/bin/pnpm".source = "${pkgs.nodePackages_latest.pnpm}/lib/node_modules/pnpm/bin/pnpm.cjs";
      ".local/bin/pnpx".source = "${pkgs.nodePackages_latest.pnpm}/lib/node_modules/pnpm/bin/pnpx.cjs";
    };
  };
  home.file.".yarnrc".text = ''
    cafile: /etc/certs/rootCA.crt
  '';
}