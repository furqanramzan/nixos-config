{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/williamboman/mason.nvim
    {
      plugin = mason-nvim;
      type = "lua";
      config = ''
        require("mason").setup()
      '';
    }
    # https://github.com/williamboman/mason-lspconfig.nvim
    {
      plugin = mason-lspconfig-nvim;
      type = "lua";
      config = ''
        require("mason-lspconfig").setup {
          ensure_installed = { "tailwindcss", "emmet_ls",  "prismals" },
        }
      '';
    }
  ];
}
