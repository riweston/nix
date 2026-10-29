{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs, home-manager, darwin, ... }:
    let
      systemSettings = rec {
        hostname = "MacBookPro";
        system = "aarch64-darwin";
      };

      pkgs = import nixpkgs {
        system = systemSettings.system;
        config.allowUnfree = true;
      };

      userSettings = rec {
        username = "riweston";
        shell = pkgs.fish;
        uid = 502;
        homeDirectory = "/Users/${username}";
      };

    in {
      darwinConfigurations."${systemSettings.hostname}" =
        darwin.lib.darwinSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit inputs;
            inherit userSettings;
          };
          modules = [
            ./darwin
            home-manager.darwinModules.home-manager
            {
              nixpkgs.hostPlatform = systemSettings.system;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${userSettings.username} = import ./home;
              home-manager.extraSpecialArgs = {
                system = systemSettings.system;
                inherit userSettings;
              };
            }
          ];
        };

      # `nix flake check` — catch eval/build breakages before switching
      checks.${systemSettings.system}.darwin-config =
        self.darwinConfigurations.${systemSettings.hostname}.config.system.build.toplevel;
    };
}
