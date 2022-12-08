{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # https://github.com/LnL7/vim-nix/
    vim-nix
    # https://github.com/preservim/vim-markdown/
    vim-markdown
    # https://github.com/cespare/vim-toml/
    vim-toml
    # https://github.com/rust-lang/rust.vim/
    rust-vim
  ];
}
