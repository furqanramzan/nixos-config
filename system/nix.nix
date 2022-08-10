{ pkgs, inputs, ... }:

{
  nix = {
    # Nix Package Manager settings
    settings = {
      auto-optimise-store = true; # Optimise syslinks
      experimental-features = [ "nix-command" "flakes" ]; # Emable flakes.
    };
    gc = {
      # Automatic garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
}
