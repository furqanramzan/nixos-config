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
    ./projects
    ./packages.nix
    ./activation.nix
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  home = {
    inherit homeDirectory stateVersion username;
  };
}

