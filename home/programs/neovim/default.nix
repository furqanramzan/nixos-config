{pkgs, ...}: {
  imports = [
    ./theme
    ./lsp.nix
    ./nullls.nix
    ./syntax.nix
    ./telescope.nix
    ./treesitter.nix
    ./tree.nix
    ./lazygit.nix
    ./lualine.nix
    ./autopairs.nix
    ./undotree.nix
    ./whichkey.nix
    ./rangehighlight.nix
    ./blankline.nix
    ./gitsigns.nix
    ./colorizer.nix
    ./barbar.nix
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.unstable.vimPlugins; [
      # https://github.com/editorconfig/editorconfig-vim/
      editorconfig-vim
      # https://github.com/tpope/vim-fugitive/
      vim-matchup
      # https://github.com/tpope/vim-surround/
      vim-surround
      # https://github.com/RRethy/vim-illuminate/
      vim-illuminate
      # https://github.com/kyazdani42/nvim-web-devicons/
      nvim-web-devicons
    ];
    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./config.lua}
      EOF
    '';
  };
}
