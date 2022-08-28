{
  imports = [
    ./lsp.nix
    ./telescope.nix
    ./treesitter.nix
    ./lazygit.nix
    ./lualine.nix
  ];

  programs.neovim = {
    enable = true;
    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./config.lua}
      EOF
    '';
  };
}
