{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/romgrk/barbar.nvim/
    {
      plugin = barbar-nvim;
      type = "lua";
      config = ''
        require('bufferline').setup {
          -- Enable/disable animations
          animation = true,
          -- Enable/disable auto-hiding the tab bar when there is a single buffer
          auto_hide = true,
          -- If true, new buffers will be inserted at the start/end of the list.
          -- Default is to insert after current buffer.
          insert_at_end = true,
          insert_at_start = false,
          -- If set, the letters for each buffer in buffer-pick mode will be
          -- assigned based on their name. Otherwise or in case all letters are
          -- already assigned, the behavior is to assign letters in order of
          -- usability (see order below)
          semantic_letters = true,
        }

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Re-order to previous/next
        map('n', '<A-<>', '<cmd>BufferMovePrevious<cr>', opts)
        map('n', '<A->>', '<cmd>BufferMoveNext<cr>', opts)

        -- Goto buffer in position...
        map('n', '<A-1>', '<cmd>BufferGoto 1<cr>', opts)
        map('n', '<A-2>', '<cmd>BufferGoto 2<cr>', opts)
        map('n', '<A-3>', '<cmd>BufferGoto 3<cr>', opts)
        map('n', '<A-4>', '<cmd>BufferGoto 4<cr>', opts)
        map('n', '<A-5>', '<cmd>BufferGoto 5<cr>', opts)
        map('n', '<A-6>', '<cmd>BufferGoto 6<cr>', opts)
        map('n', '<A-7>', '<cmd>BufferGoto 7<cr>', opts)
        map('n', '<A-8>', '<cmd>BufferGoto 8<cr>', opts)
        map('n', '<A-9>', '<cmd>BufferGoto 9<cr>', opts)
        map('n', '<A-0>', '<cmd>BufferLast<cr>', opts)
      '';
    }
    # https://github.com/kyazdani42/nvim-tree.lua/
    {
      plugin = nvim-tree-lua;
      type = "lua";
      config = ''
        require('nvim-tree').setup{
          update_focused_file = {
            enable = true,
          },
        }

        local nvim_tree_events = require('nvim-tree.events')
        local bufferline_state = require('bufferline.api')

        local function get_tree_size()
          return require'nvim-tree.view'.View.width
        end

        nvim_tree_events.subscribe('TreeOpen', function()
          bufferline_state.set_offset(get_tree_size())
        end)

        nvim_tree_events.subscribe('Resize', function()
          bufferline_state.set_offset(get_tree_size())
        end)

        nvim_tree_events.subscribe('TreeClose', function()
          bufferline_state.set_offset(0)
        end)
      '';
    }
  ];
}
