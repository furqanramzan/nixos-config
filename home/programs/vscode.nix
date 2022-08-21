{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
  };
  # Nix language server.
  home.packages = [ pkgs.rnix-lsp ];
}
