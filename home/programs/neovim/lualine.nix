{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    {
      plugin = lualine-nvim;
      type = "lua";
      config = ''
        require('lualine').setup {}
      '';
    }
  ];
}
