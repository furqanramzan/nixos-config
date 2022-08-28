{ pkgs, ... }:

{
  home.packages = [
    pkgs.lazygit
  ];

  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    {
      plugin = lazygit-nvim;
      type = "lua";
      config = ''
        vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>')
      '';
    }
  ];
}
