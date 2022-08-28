{ pkgs, ... }:

{
  home.packages = [
    pkgs.ripgrep # Required for live_grep by neovim telescope plugin.
  ];

  programs.neovim.plugins = with pkgs.unstable; [
    luajitPackages.plenary-nvim # Telescope dependency
    {
      plugin = vimPlugins.telescope-nvim;
      type = "lua";
      config = ''
        vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
        vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>')
        vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>')
        vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>')
        vim.keymap.set('n', '<leader>fc', ':Telescope commands<cr>')
        vim.keymap.set('n', '<leader>fm', ':Telescope man_pages<cr>')
      '';
    }
    {
      plugin = vimPlugins.telescope-file-browser-nvim;
      type = "lua";
      config = ''
        -- To get telescope-file-browser loaded and working with telescope,
        -- you need to call load_extension, somewhere after setup function:
        require("telescope").load_extension "file_browser"
        vim.keymap.set('n', '<leader>fe', ':Telescope file_browser<cr>')
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
