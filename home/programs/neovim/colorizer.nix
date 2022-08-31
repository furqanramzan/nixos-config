{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    # https://github.com/norcalli/nvim-colorizer.lua/
    {
      plugin = nvim-colorizer-lua;
      type = "lua";
      config = ''
        require('colorizer').setup{}
      '';
    }
  ];
}
