{pkgs, ...}: {
  home.packages = with pkgs; [
    # Javascript, Typescript, JSX, TSX
    nodePackages.typescript-language-server
    nodePackages.bash-language-server
    # Go
    gopls
    # HTML, CSS, JSON
    nodePackages.vscode-langservers-extracted
    sumneko-lua-language-server
    # Nix
    rnix-lsp
    # PHP
    nodePackages.intelephense
    python310Packages.python-lsp-server
    rust-analyzer
    nodePackages.svelte-language-server
    nodePackages.yaml-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.grammarly-languageserver
    # Vue
    nodePackages.volar
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/neovim/nvim-lspconfig/
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = ''
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
        vim.diagnostic.config({
          signs = true,
          underline = true,
          -- With the default settings, you will not see updated diagnostics until you leave insert mode.
          -- Set update_in_insert = true if you want diagnostics to update while in insert mode.
          update_in_insert = false,
          severity_sort = true,
          virtual_text = {
            -- source = "always",  -- Or "if_many"
            prefix = '●', -- Could be '■', '▎', 'x'
          },
          float = {
            source = "always",  -- Or "if_many"
          },
        })
        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
          -- Disable formatting, use null ls
          client.server_capabilities.documentFormattingProvider = false
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

          -- Mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local bufopts = { noremap=true, silent=true, buffer=bufnr }
          wk.register({
            g = {
              name = "LSP",
              e = { vim.lsp.buf.declaration, "Declaration" },
              d = { vim.lsp.buf.definition, "Definition" },
              h = { vim.lsp.buf.hover, "Hover" },
              i = { vim.lsp.buf.implementation, "Implementation" },
              s = { vim.lsp.buf.signature_help, "Signature Help" },
              t = { vim.lsp.buf.type_definition, "Type Definition" },
              n = { vim.lsp.buf.rename, "Variable Rename" },
              w = { vim.lsp.buf.code_action, "Code Action" },
              r = { vim.lsp.buf.references, "References" },
              o = { vim.diagnostic.open_float, "Diagnostic Open Float" },
              j = { vim.diagnostic.goto_prev, "Diagnostic Goto Previous" },
              k = { vim.diagnostic.goto_next, "Diagnostic Goto Next" },
              l = { vim.diagnostic.setloclist, "Diagnostic Set Location List" },
            },
          }, bufopts)

          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, bufopts)
        end

        local lsp_flags = {
          -- This is the default in Nvim 0.7+
          debounce_text_changes = 150,
        }

        -- Add additional capabilities supported by nvim-cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local lspconfig = require "lspconfig"

        -- typescript-language-server
        lspconfig.tsserver.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- bash-language-server
        lspconfig.bashls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- gopls
        lspconfig.gopls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- vscode-langservers-extracted
        lspconfig.html.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- vscode-langservers-extracted
        lspconfig.jsonls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- vscode-langservers-extracted
        lspconfig.cssls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- sumneko-lua-language-server
        lspconfig.lua_ls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- rnix-lsp
        lspconfig.rnix.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- intelephense
        lspconfig.intelephense.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- python-lsp-server
        lspconfig.pylsp.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- rust-analyzer
        lspconfig.rust_analyzer.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- svelte-language-server
        lspconfig.svelte.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- yaml-language-server
        lspconfig.yamlls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        -- dockerfile-language-server-nodejs
        lspconfig.dockerls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        lspconfig.volar.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        lspconfig.tailwindcss.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        lspconfig.astro.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        lspconfig.emmet_ls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        lspconfig.grammarly.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        lspconfig.nxls.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
        lspconfig.prismals.setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
        }
      '';
    }

    # Autocomplete

    # https://github.com/hrsh7th/cmp-nvim-lsp/
    cmp-nvim-lsp
    # https://github.com/saadparwaiz1/cmp_luasnip/
    cmp_luasnip
    # https://github.com/l3mon4d3/luasnip/
    luasnip
    # https://github.com/hrsh7th/cmp-buffer/
    cmp-buffer
    # https://github.com/hrsh7th/cmp-path/
    cmp-path
    lspkind-nvim
    # https://github.com/hrsh7th/nvim-cmp/
    {
      plugin = nvim-cmp;
      type = "lua";
      config = ''
        -- luasnip setup
        local luasnip = require 'luasnip'

        -- nvim-cmp setup
        local cmp = require 'cmp'
        cmp.setup {
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' }),
          }),
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
        }
      '';
    }
  ];
}
