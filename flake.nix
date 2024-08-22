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
    nh_darwin.url = "github:ToyVo/nh_darwin";
    # Temp fix until https://github.com/nix-community/home-manager/issues/1341 is resolved
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, nh_darwin
    , mac-app-util, ... }:
    let
      systemSettings = rec {
        hostname = "MAC-EVIDEN-NQK9H7JC54";
        system = "aarch64-darwin";
      };

      pkgs = import nixpkgs {
        system = systemSettings.system;
        config.allowUnfree = true;
      };

      userSettings = rec {
        username = "riweston";
        shell = pkgs.fish;
        uid = 501;
        homeDirectory = "/Users/${username}";
      };

    in {
      darwinConfigurations."${systemSettings.hostname}" =
        darwin.lib.darwinSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit inputs;
            inherit userSettings;
            inherit nh_darwin;
          };
          modules = [
            ./darwin
            home-manager.darwinModules.home-manager
            {
              nixpkgs.hostPlatform = systemSettings.system;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${userSettings.username} = import ./home;
              home-manager.sharedModules = [
                # This links up home-manager enabled programs with Mac Applications
                # so that they can be opened from the Dock or Spotlight
                mac-app-util.homeManagerModules.default
              ];
              home-manager.extraSpecialArgs = {
                system = systemSettings.system;
                inherit userSettings;
                inherit nh_darwin;
              };
            }
          ];
        };

      # homeConfigurations.riweston = home-manager.lib.homeManagerConfiguration {
      #   inherit pkgs;

      #   modules = [ ./home ];
      #   extraSpecialArgs = {
      #     inherit system;
      #     inherit userSettings;
      #   };
      # };
    };
}
