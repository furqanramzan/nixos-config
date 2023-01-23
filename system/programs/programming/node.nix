{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    nodePackages_latest.pnpm
    yarn
    nodePackages.pm2
    nodePackages.vue-cli
    nodePackages.typescript
    nodePackages_latest.npm-check-updates
    nodePackages_latest.react-native-cli
  ];

  programs.npm = {
    enable = true;
    package = pkgs.nodePackages.npm;
    npmrc = ''
      prefix=$HOME/.npm
      color=true
      cafile="/etc/certs/rootCA.crt"
      registry=https://npmjs.localhost/
    '';
  };
}
