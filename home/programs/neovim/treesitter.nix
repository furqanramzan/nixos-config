{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.unstable; [
    (vimPlugins.nvim-treesitter.withPlugins (_: tree-sitter.allGrammars))
  ];
}
