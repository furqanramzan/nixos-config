{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # System Utilities
    which
    curl
    wget
    bat # Replacement of cat utility, with code formatting.
    htop # Resource monitoring tool.
    btop # Replacement of htop.
    parted # Disk partitioning tool.
    killall
    # pciutils # The PCI Utilities.
    # usbutils # The USB Utilities.
    pfetch # Minimal Fetch
    unzip # Decompress zip files.
    unrar # Decompress zip files.
    tmux
    ranger # Console based file manager

    # Editor
    helix
  ];
}
