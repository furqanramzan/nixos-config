{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
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
    # PHP
    pkgs.php81
    pkgs.php81Packages.composer
    # Java
    pkgs.jdk # The JDK includes JRE.


    # System Utilities
    pkgs.which
    pkgs.curl
    pkgs.wget
    pkgs.bat # Replacement of cat utility, with code formatting. 
    pkgs.htop # Resource monitoring tool.
    pkgs.btop # Replacement of htop.
    pkgs.parted # Disk partitioning tool.
    pkgs.killall
    # pkgs.pciutils # The PCI Utilities.
    # pkgs.usbutils # The USB Utilities.
    pkgs.pfetch # Minimal Fetch
    pkgs.unzip # Decompress zip files.
    pkgs.unrar # Decompress zip files.
    pkgs.tmux
    pkgs.lazygit
    pkgs.ranger # Console based file manager

    # Editor
    pkgs.helix
    pkgs-unstable.neovim
    pkgs.ripgrep # Required for live_grep by neovim telescope plugin.
  ];
}
