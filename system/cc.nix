{
  imports = [
    ./default.nix
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
  boot.kernelModules = ["kvm-intel"];
}
