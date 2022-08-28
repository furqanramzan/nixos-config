{ homeDirectory
, stateVersion
, username
, nix-colors
, plasma-manager
, pkgs-unstable
, ...
}:

{
  imports = [
    nix-colors.homeManagerModule
    plasma-manager.homeManagerModules.plasma-manager
    ./programs
    ./packages.nix
    ./activation.nix
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  home = {
    inherit homeDirectory stateVersion username;
  };

  programs.neovim.plugins = [
    (pkgs-unstable.vimPlugins.nvim-treesitter.withPlugins (_: pkgs-unstable.tree-sitter.allGrammars))
    {
      plugin = pkgs-unstable.vimPlugins.lazygit-nvim;
      type = "lua";
      config = ''
        vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>')
      '';
    }

    pkgs-unstable.luajitPackages.plenary-nvim # Telescope dependency
    {
      plugin = pkgs-unstable.vimPlugins.telescope-nvim;
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
      plugin = pkgs-unstable.vimPlugins.telescope-file-browser-nvim;
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
    #   plugin = pkgs-unstable.vimPlugins.sqlite-lua;
    #   type = "lua";
    #   config = ''
    #     vim.api.nvim_set_var('sqlite_clib_path', '${pkgs-unstable.sqlite.out}/lib/libsqlite3.so')
    #   '';
    # }
    # {
    #   plugin = pkgs-unstable.vimPlugins.telescope-cheat-nvim;
    #   type = "lua";
    #   config = ''
    #     require("telescope").load_extension "cheat"
    #   '';
    # }

    {
      plugin = pkgs-unstable.vimPlugins.lualine-nvim;
      type = "lua";
      config = ''
        require('lualine').setup {}
      '';
    }

    {
      plugin = pkgs-unstable.vimPlugins.nvim-lspconfig;
      type = "lua";
      config = ''
        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        local opts = { noremap=true, silent=true }
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

          -- Mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local bufopts = { noremap=true, silent=true, buffer=bufnr }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, bufopts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
          vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
          vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
        end

        local lsp_flags = {
          -- This is the default in Nvim 0.7+
          debounce_text_changes = 150,
        }

        local lspconfig = require "lspconfig"
        local servers = { "tsserver" }

        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            on_attach = on_attach,
            flags = lsp_flags,
          }
        end
      '';
    }

    {
      plugin = pkgs-unstable.vimPlugins.null-ls-nvim;
      type = "lua";
      config = ''
        local nullls = require "null-ls"
        local builtins = nullls.builtins

        nullls.setup({
            sources = {
                builtins.code_actions.eslint_d,
                builtins.diagnostics.eslint_d,
                builtins.formatting.prettier_d_slim,
            },
        })
      '';
    }
  ];
}

