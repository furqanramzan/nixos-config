{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/folke/which-key.nvim/
    {
      plugin = which-key-nvim;
      type = "lua";
      config = ''
        wk = require("which-key")
        wk.setup{}

        wk.register({
          e = { "<cmd>NvimTreeToggle<cr>", "Toggle tree" },
          c = { "<cmd>BufferClose<cr>", "Close buffer" },
          x = { "<cmd>BufferCloseAllButPinned<cr>", "Close all buffer" },
          b = {
            name = "Buffer+Tree",

            p = { "<cmd>BufferPin<cr>", "Pin/unpin buffer" },
            m = { "<cmd>BufferPick<cr>", "Magic buffer-picking mode" },
            k = { "<cmd>BufferPrevious<cr>", "Previous buffer" },
            j = { "<cmd>BufferNext<cr>", "Next buffer"  },

            u = { "<cmd>UndotreeToggle<cr>", "Unto tree" },
          },

          g = {
            name = "Git",
            b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Line Blame" },
            g = { "<cmd>LazyGit<cr>", "Lazy Git" },
            j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
            k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
            l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
            p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
            r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
            R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
            s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
            u = {
              "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
              "Undo Stage Hunk",
            },
            o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
            b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
            C = {
              "<cmd>Telescope git_bcommits<cr>",
              "Checkout commit(for current file)",
            },
            d = {
              "<cmd>Gitsigns diffthis HEAD<cr>",
              "Git Diff",
            },
          },

          f = {
            name = "Telescope",
            f = { "<cmd>Telescope git_files<cr>", "Find File" },
            t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
            b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
            h = { "<cmd>Telescope help_tags<cr>", "Find Help Tag" },
            c = { "<cmd>Telescope commands<cr>", "Find Command" },
            m = { "<cmd>Telescope man_pages<cr>", "Find Manual Page" },
            r = { "<cmd>Telescope resume<cr>", "Resume" },
            k = { "<cmd>Telescope keymaps<cr>", "Find Key Mapping" },
          },
        }, { prefix = "<leader>" })
      '';
    }
  ];
}
