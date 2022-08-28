{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.unstable; [
    # https://github.com/nvim-treesitter/nvim-treesitter/
    (vimPlugins.nvim-treesitter.withPlugins (_: tree-sitter.allGrammars))
  ];
}
