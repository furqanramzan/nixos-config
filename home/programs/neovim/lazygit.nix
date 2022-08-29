{ pkgs, ... }:

{
  home.packages = [
    # https://github.com/jesseduffield/lazygit
    pkgs.lazygit
  ];

  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    # https://github.com/kdheepak/lazygit.nvim/
    {
      plugin = lazygit-nvim;
      type = "lua";
      config = ''
        require('lualine').setup {}
        vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>')
      '';
    }
  ];
}
