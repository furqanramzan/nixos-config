{pkgs, ...}: {
  imports = [
    ./docker.nix
    ./git.nix
    ./neovim.nix
    ./gnupg.nix
    ./tlp.nix
    ./fish.nix
  ];
  environment.systemPackages = with pkgs; [
    wget
    whois
    which
    htop # Resource monitoring tool.
    btop # Replacement of htop.
    parted # Disk partitioning tool.
    killall
    pfetch # Minimal Fetch
    unzip # Decompress zip files.
    unrar # Decompress zip files.
    tmux
    ranger # Console based file manager.
    notify-desktop # Lets you send desktop notifications with one command
    sonar-scanner-cli
  ];
}
