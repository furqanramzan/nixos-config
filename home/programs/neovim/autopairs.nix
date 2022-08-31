{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    # https://github.com/windwp/nvim-autopairs/
    {
      plugin = nvim-autopairs;
      type = "lua";
      config = ''
        require('nvim-autopairs').setup{}
      '';
    }
  ];
}
