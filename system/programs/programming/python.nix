{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pkgs.python310
    pkgs.python310Packages.pip
  ];
}
