{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # http://github.com/lewis6991/gitsigns.nvim
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require('gitsigns').setup{}
      '';
    }
  ];
}
