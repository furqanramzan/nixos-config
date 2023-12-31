{pkgs, ...}: {
  home.packages = [
    # https://github.com/jesseduffield/lazygit
    pkgs.lazygit
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/kdheepak/lazygit.nvim/
    {
      plugin = lazygit-nvim;
      type = "lua";
      config = ''
        require('lualine').setup {}
      '';
    }
  ];
}
