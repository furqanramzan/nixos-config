{ homeDirectory
, stateVersion
, username
, nix-colors
, ...
}:

{
  imports = [
    nix-colors.homeManagerModule
    ./programs.nix
    ./packages.nix
    ./activation.nix
    ./files.nix
    ./desktop/default.nix
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  home = {
    inherit homeDirectory stateVersion username;
  };
}

