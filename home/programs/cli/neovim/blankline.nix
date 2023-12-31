{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/lukas-reineke/indent-blankline.nvim/
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = ''
        require('indent_blankline').setup{}
      '';
    }
  ];
}
