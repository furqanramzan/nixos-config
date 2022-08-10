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
  ];

  home = {
    inherit homeDirectory stateVersion username;
  };
}

