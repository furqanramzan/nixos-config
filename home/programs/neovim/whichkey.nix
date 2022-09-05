{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/folke/which-key.nvim/
    {
      plugin = which-key-nvim;
      type = "lua";
      config = ''
        require('which-key').setup{}
      '';
    }
  ];
}
