{ homeDirectory
, stateVersion
, username
, nix-colors
, plasma-manager
, ...
}:

{
  imports = [
    nix-colors.homeManagerModule
    plasma-manager.homeManagerModules.plasma-manager
    ./programs
    ./packages.nix
    ./activation.nix
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  home = {
    inherit homeDirectory stateVersion username;
  };
}

