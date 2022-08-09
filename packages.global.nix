{ pkgs }:

let packages = with pkgs; [
  firefox
  htop
];
in packages
