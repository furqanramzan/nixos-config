{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    # https://github.com/winston0410/range-highlight.nvim/
    {
      plugin = range-highlight-nvim;
      type = "lua";
      config = ''
        require('range-highlight').setup{}
      '';
    }
  ];
}
