{ pkgs-unstable, ... }:

{
  programs.neovim = {
    enable = true;
    # Make neovim default editor
    defaultEditor = true;
    package = pkgs-unstable.neovim-unwrapped;
    # Bind vi alias to neovim
    viAlias = true;
  };
}
