{pkgs, ...}: {
  # Enable plasma desktop manager.
  services.xserver = {
    desktopManager.plasma5.enable = true;
  };

  environment.systemPackages = [pkgs.libsForQt5.ark];
}
