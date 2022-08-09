{ homeDirectory
, pkgs
, stateVersion
, system
, username
}:

let
  packages = import ./packages.home.nix { inherit pkgs; };
in
{
  home = {
    inherit homeDirectory packages stateVersion username;

    shellAliases = {
      reload-home-manager-config = "home-manager switch --flake ${builtins.toString ./.}";
    };

    activation = import ./activation.home.nix { inherit homeDirectory; }; # Run scripts during rebuild/switch

    file = import ./files.home.nix; # Copy files to home directory
  };

  nixpkgs = {
    config = {
      inherit system;
      allowUnfree = true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes";
    };
  };

  programs = import ./programs.home.nix;
}

