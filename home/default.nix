{
  inputs,
  configs,
  ...
}: let
  inherit (inputs) plasma-manager nix-colors android-nixpkgs;
  inherit (configs) username homeDirectory stateVersion;
in {
  imports = [
    nix-colors.homeManagerModule
    plasma-manager.homeManagerModules.plasma-manager
    android-nixpkgs.hmModule
    ./programs
    ./projects
    ./packages.nix
    ./activation.nix
  ];

  colorScheme = nix-colors.colorSchemes.tokyo-night-storm;

  home = {
    inherit homeDirectory stateVersion username;
    file = {
      ".gitignore" = {
        source = ./gitignore.home;
      };
    };
  };
}
