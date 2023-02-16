{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs-slim-14_x
  ];
}
