{ pkgs-unstable, ... }:

{
  programs.neovim = {
    enable = true;
    # Make neovim default editor
    defaultEditor = true;
    # Bind vi alias to neovim
    vimAlias = true;
  };
}
