{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs-18_x
    nodePackages.pnpm
    nodePackages.yarn
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
