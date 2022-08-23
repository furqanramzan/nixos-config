{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Bash
    nodePackages.bash-language-server
    # Go
    gopls
    # Javascript, Typescript, JSX, TSX
    nodePackages.typescript-language-server
    # HTML, CSS, JSON
    nodePackages.vscode-langservers-extracted
    # Lua
    sumneko-lua-language-server
    # Nix
    rnix-lsp
    # PHP
    nodePackages.intelephense
    # Python
    python310Packages.python-lsp-server
    # Rust
    rust-analyzer
    # Svelte
    nodePackages.svelte-language-server
    # Toml
    taplo-lsp
    # Vue
    nodePackages.vls
    # YAML
    nodePackages.yaml-language-server
  ];
}
