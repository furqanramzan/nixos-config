{configs, ...}: let
  inherit (configs) homeDirectory;
in {
  boot.supportedFilesystems = ["ntfs"];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  fileSystems."${homeDirectory}/data" = {
    device = "/dev/disk/by-label/data";
    fsType = "ext4";
  };

  swapDevices = [{device = "/dev/disk/by-label/swap";}];
}
