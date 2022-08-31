{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pkgs.rustup
    pkgs.rustc
    pkgs.cargo
  ];
}
