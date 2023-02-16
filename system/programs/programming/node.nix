{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    nodePackages.pnpm
    yarn
    nodePackages.pm2
    nodePackages.vue-cli
    nodePackages.typescript
    nodePackages.npm-check-updates
    nodePackages.react-native-cli
  ];

  programs.npm = {
    enable = true;
    package = pkgs.nodePackages.npm;
    npmrc = ''
      prefix=$HOME/.npm
      color=true
      # cafile="/etc/certs/rootCA.crt"
      # registry=https://npmjs.localhost/
    '';
  };
}
