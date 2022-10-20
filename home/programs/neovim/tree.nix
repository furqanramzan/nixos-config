{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/kyazdani42/nvim-tree.lua/
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = ''
        require('nvim-tree').setup({
          update_focused_file = {
            enable = true,
          },
        })
        vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>')
      '';
    }
  ];
}
