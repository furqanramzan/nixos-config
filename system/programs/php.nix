{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.php81
    pkgs.php81Packages.composer
  ];
}
