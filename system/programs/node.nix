{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    nodePackages_latest.pnpm
    nodePackages_latest.yarn
    nodePackages.pm2
    nodePackages.vue-cli
    nodePackages.typescript
  ];

  programs.npm = {
    enable = true;
    package = pkgs.nodePackages.npm;
    npmrc = ''
      prefix=$HOME/.npm
      color=true
    '';
  };
}
