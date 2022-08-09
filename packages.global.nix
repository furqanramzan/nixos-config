{ pkgs, pkgs-unstable }:

let packages = [
  # Development
  # C++
  pkgs.gcc
  pkgs.gnumake
  # Nodejs
  pkgs.nodejs-18_x
  pkgs.nodePackages_latest.pnpm
  pkgs.nodePackages_latest.yarn
  # Python
  pkgs.python310
  pkgs.python310Packages.pip
  # Rust
  pkgs.rustup
  pkgs.rustc
  pkgs.cargo

  # Browser
  pkgs.firefox

  # System Utilities
  pkgs.htop

  # Editor
  pkgs-unstable.neovim
];
in packages


