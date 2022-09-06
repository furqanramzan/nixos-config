{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # http://github.com/lewis6991/gitsigns.nvim
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require('gitsigns').setup{}
        vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>')
      '';
    }
  ];
}
