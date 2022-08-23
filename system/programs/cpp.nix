{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.gcc
    pkgs.gnumake
  ];
}
