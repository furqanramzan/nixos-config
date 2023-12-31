{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/mbbill/undotree/
    {
      plugin = undotree;
      type = "lua";
      config = ''
        vim.g.undotree_SetFocusWhenToggle = 1
      '';
    }
  ];
}
