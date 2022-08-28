{ pkgs, ... }:

{
  home.packages = [
    pkgs.ripgrep # Required for live_grep by neovim telescope plugin.
  ];

  programs.neovim.plugins = with pkgs.unstable; [
    # http://github.com/nvim-lua/plenary.nvim
    luajitPackages.plenary-nvim # Telescope dependency
    # https://github.com/nvim-telescope/telescope.nvim/
    {
      plugin = vimPlugins.telescope-nvim;
      type = "lua";
      config = ''
        vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
        vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
        vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
        vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
        vim.keymap.set('n', '<leader>fc', '<cmd>Telescope commands<cr>')
        vim.keymap.set('n', '<leader>fm', '<cmd>Telescope man_pages<cr>')
      '';
    }
    # https://github.com/nvim-telescope/telescope-file-browser.nvim/
    {
      plugin = vimPlugins.telescope-file-browser-nvim;
      type = "lua";
      config = ''
        -- To get telescope-file-browser loaded and working with telescope,
        -- you need to call load_extension, somewhere after setup function:
        require("telescope").load_extension "file_browser"
        vim.keymap.set('n', '<leader>fe', '<cmd>Telescope file_browser<cr>')
      '';
    }
    # Cheat.sh dependency
    # {
    #   plugin = vimPlugins.sqlite-lua;
    #   type = "lua";
    #   config = ''
    #     vim.api.nvim_set_var('sqlite_clib_path', '${sqlite.out}/lib/libsqlite3.so')
    #   '';
    # }
    # {
    #   plugin = vimPlugins.telescope-cheat-nvim;
    #   type = "lua";
    #   config = ''
    #     require("telescope").load_extension "cheat"
    #   '';
    # }
  ];
}
