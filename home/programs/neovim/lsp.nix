{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Javascript, Typescript, JSX, TSX
    nodePackages.typescript-language-server
    # Bash
    nodePackages.bash-language-server
    # Go
    gopls
    # HTML, CSS, JSON
    nodePackages.vscode-langservers-extracted
    # Lua
    sumneko-lua-language-server
    # Nix
    rnix-lsp
    # PHP
    nodePackages.intelephense
    # Python
    python310Packages.python-lsp-server
    # Rust
    rust-analyzer
    # Svelte
    nodePackages.svelte-language-server
    # Vue
    nodePackages.vls
    # YAML
    nodePackages.yaml-language-server
    # Docker
    nodePackages.dockerfile-language-server-nodejs
  ];

  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    # https://github.com/neovim/nvim-lspconfig/
    {
      plugin = nvim-lspconfig;
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
        
        -- typescript-language-server
        lspconfig.tsserver.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- bash-language-server
        lspconfig.bashls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- gopls
        lspconfig.gopls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- vscode-langservers-extracted
        lspconfig.html.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- vscode-langservers-extracted
        lspconfig.jsonls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- vscode-langservers-extracted
        lspconfig.cssls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- sumneko-lua-language-server
        lspconfig.sumneko_lua.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- rnix-lsp
        lspconfig.rnix.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- intelephense
        lspconfig.intelephense.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- python-lsp-server
        lspconfig.pylsp.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- rust-analyzer
        lspconfig.rust_analyzer.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- svelte-language-server
        lspconfig.svelte.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- yaml-language-server
        lspconfig.yamlls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
        -- dockerfile-language-server-nodejs
        lspconfig.dockerls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
        }
      '';
    }
  ];
}
