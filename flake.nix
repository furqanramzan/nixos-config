{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    nix-colors.url = "github:misterio77/nix-colors";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nix-colors,
    plasma-manager,
  }: let
    username = "furqan"; # $USER
    name = "Muhammad Furqan"; # $NAME
    email = "furqanramzan271996@gmail.com"; # $EMAIL
    system = "x86_64-linux"; # x86_64-linux, aarch64-multiplatform, etc.
    stateVersion = "22.05"; # See https://nixos.org/manual/nixpkgs/stable for most recent
    pkgs-common-config = {
      inherit system;
      config = {
        allowUnfree = true; # Allow proprietary software.
      };
    };
    pkgs-config =
      pkgs-common-config
      // {
        overlays = [
          (self: super: {
            unstable = import nixpkgs-unstable pkgs-common-config;
          })
        ];
      };
    pkgs = import nixpkgs pkgs-config;

    homeDirPrefix =
      if pkgs.stdenv.hostPlatform.isDarwin
      then "/Users"
      else "/home";
    homeDirectory = "${homeDirPrefix}/${username}";

    home = import ./home {
      inherit homeDirectory pkgs stateVersion system username nix-colors plasma-manager;
    };
  in {
    nixosConfigurations = {
      config = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit username name email pkgs;};
        modules = [
          ./system
          home-manager.nixosModules.home-manager
          {
            # https://nix-community.github.io/home-manager/nixos-options.html
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # On activation move existing files by appending the given file extension rather than exiting with an error.
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username} = home;
          }
        ];
      };
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        home
      ];
    };
  };
}
