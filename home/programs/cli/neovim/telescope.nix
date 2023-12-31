{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep # Required for live_grep by neovim telescope plugin.
    fd
  ];

  programs.neovim.plugins = with pkgs; [
    # http://github.com/nvim-lua/plenary.nvim
    # luajitPackages.plenary-nvim # Telescope dependency
    # https://github.com/nvim-telescope/telescope.nvim/
    {
      plugin = vimPlugins.telescope-nvim;
    }
    # https://github.com/nvim-telescope/telescope-file-browser.nvim/
    {
      plugin = vimPlugins.telescope-file-browser-nvim;
      type = "lua";
      config = ''
        -- To get telescope-file-browser loaded and working with telescope,
        -- you need to call load_extension, somewhere after setup function:
        require("telescope").load_extension "file_browser"
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
    {
      plugin = vimPlugins.telescope-fzf-native-nvim;
      type = "lua";
      config = ''
        require("telescope").load_extension('fzf')
      '';
    }
  ];
}
