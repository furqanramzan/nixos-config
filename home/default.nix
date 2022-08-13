{ homeDirectory
, stateVersion
, username
, ...
}:

{
  imports = [
    ./programs.nix
    ./packages.nix
    ./activation.nix
    ./files.nix
    ./desktop/default.nix
  ];

  home = {
    inherit homeDirectory stateVersion username;
  };
}

