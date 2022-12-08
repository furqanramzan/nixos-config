{
  config,
  pkgs,
  ...
}: let
  inherit (config.colorscheme) colors;
in {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/arkav/lualine-lsp-progress/
    lualine-lsp-progress
    # https://github.com/nvim-lualine/lualine.nvim
    {
      plugin = lualine-nvim;
      type = "lua";
      config = ''
        require('lualine').setup {
          options = {
            component_separators = '|',
            theme  = {
              normal = {
                a = { bg = '#${colors.base0E}', fg = '#${colors.base00}', gui = 'bold' },
                b = { bg = '#${colors.base03}', fg = '#${colors.base07}' },
                c = { bg = '#${colors.base02}', fg = '#${colors.base07}' },
              },
              insert = {
                a = { bg = '#${colors.base0F}', fg = '#${colors.base00}', gui = 'bold' },
                b = { bg = '#${colors.base03}', fg = '#${colors.base07}' },
                c = { bg = '#${colors.base02}', fg = '#${colors.base07}' },
              },
              visual = {
                a = { bg = '#${colors.base0B}', fg = '#${colors.base00}', gui = 'bold' },
                b = { bg = '#${colors.base03}', fg = '#${colors.base07}' },
                c = { bg = '#${colors.base02}', fg = '#${colors.base07}' },
              },
              replace = {
                a = { bg = '#${colors.base08}', fg = '#${colors.base00}', gui = 'bold' },
                b = { bg = '#${colors.base03}', fg = '#${colors.base07}' },
                c = { bg = '#${colors.base02}', fg = '#${colors.base07}' },
              },
              command = {
                a = { bg = '#${colors.base04}', fg = '#${colors.base00}', gui = 'bold' },
                b = { bg = '#${colors.base03}', fg = '#${colors.base07}' },
                c = { bg = '#${colors.base02}', fg = '#${colors.base07}' },
              },
              inactive = {
                a = { bg = '#${colors.base02}', fg = '#${colors.base07}', gui = 'bold' },
                b = { bg = '#${colors.base03}', fg = '#${colors.base07}' },
                c = { bg = '#${colors.base02}', fg = '#${colors.base07}' },
              },
            }
          },
          sections = {
            lualine_c = {
              'filename', 'lsp_progress'
            }
          }
        }
      '';
    }
  ];
}
