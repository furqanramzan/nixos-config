{ pkgs }:

let
  nixTools = with pkgs; [
    cachix
    lorri
    wget
  ];
in nixTools
