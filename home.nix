{ homeDirectory
, pkgs
, stateVersion
, system
, username
, ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./programs.home.nix
    ./packages.home.nix
    ./activation.home.nix
    ./files.home.nix
  ];

  home = {
    inherit homeDirectory stateVersion username;

    shellAliases = {
      reload-home-manager-config = "home-manager switch --flake ${builtins.toString ./.}";
    };
  };

  nixpkgs = {
    config = {
      inherit system;
      allowUnfree = true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes";
    };
  };
}

