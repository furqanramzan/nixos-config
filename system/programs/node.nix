{pkgs, ...}: {
  environment.systemPackages = with pkgs.unstable; [
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
    nodePackages.pm2
    nodePackages.vue-cli
    nodePackages.typescript
  ];
}
