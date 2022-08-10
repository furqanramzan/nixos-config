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
    ./programs.nix
    ./packages.nix
    ./activation.nix
    ./files.nix
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

