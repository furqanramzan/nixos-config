{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    nodePackages_latest.pnpm
    nodePackages_latest.yarn
    nodePackages_latest.pm2
    nodePackages_latest.vue-cli
    nodePackages_latest.typescript
  ];

  programs.npm = {
    enable = true;
    package = pkgs.nodePackages_latest.npm;
    npmrc = ''
      prefix=$HOME/.npm
      color=true
    '';
  };
}
