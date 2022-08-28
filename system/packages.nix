{ pkgs, ... }:

{
  environment.systemPackages = [
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
    pkgs.unstable.helix
    pkgs.unstable.neovim
    pkgs.ripgrep # Required for live_grep by neovim telescope plugin.
  ];
}
