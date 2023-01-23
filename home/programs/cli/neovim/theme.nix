{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/folke/tokyonight.nvim/
    {
      plugin = tokyonight-nvim;
      config = ''
        syntax enable
        colorscheme tokyonight-storm
      '';
    }
  ];
}
