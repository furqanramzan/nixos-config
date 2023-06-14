{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    yarn
    nodePackages.pnpm
    nodePackages.pm2
    nodePackages.typescript
    nodePackages.npm-check-updates
  ];

  programs.npm = {
    enable = true;
    package = pkgs.nodePackages.npm;
    npmrc = ''
      color=true
      # cafile="/etc/certs/rootCA.crt"
      # registry=https://npmjs.localhost/
    '';
  };
}
