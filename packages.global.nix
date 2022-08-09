{ pkgs, pkgs-unstable }:

let packages = [
  pkgs.firefox
  pkgs.htop
  pkgs-unstable.neovim
];
in packages


