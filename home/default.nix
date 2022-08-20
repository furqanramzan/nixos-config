{ homeDirectory
, stateVersion
, username
, nix-colors
, ...
}:

{
  imports = [
    nix-colors.homeManagerModule
    ./programs
    ./packages.nix
    ./activation.nix
    ./files.nix
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  home = {
    inherit homeDirectory stateVersion username;
  };
}

