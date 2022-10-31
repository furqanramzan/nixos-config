{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-22.05";

    nix-colors.url = "github:misterio77/nix-colors";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nix-colors,
    plasma-manager,
    android-nixpkgs,
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
          android-nixpkgs.overlays.default
        ];
      };
    pkgs = import nixpkgs pkgs-config;

    homeDirPrefix =
      if pkgs.stdenv.hostPlatform.isDarwin
      then "/Users"
      else "/home";
    homeDirectory = "${homeDirPrefix}/${username}";

    home = import ./home {
      inherit homeDirectory pkgs stateVersion system username nix-colors plasma-manager android-nixpkgs;
    };
  in {
    nixosConfigurations = {
      pc = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit username name email pkgs homeDirectory;};
        modules = [
          ./system/pc.nix
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

    nixosConfigurations = {
      cc = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit username name email pkgs homeDirectory;};
        modules = [
          ./system/cc.nix
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
