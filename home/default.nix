{
  homeDirectory,
  stateVersion,
  username,
  nix-colors,
  plasma-manager,
  android-nixpkgs,
  ...
}: {
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
