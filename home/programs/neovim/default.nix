{ pkgs-unstable, ... }:

{
  programs.neovim = {
    enable = true;
    
    # Add library code here for use in the Lua config from the
    # plugins list above.
    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./neovim.lua}
      EOF
    '';
  };
}
