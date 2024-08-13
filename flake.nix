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

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    darwin,
    nh_darwin,
    mac-app-util,
    ...
  }: let
      hostname = "MAC-EVIDEN-NQK9H7JC54";
      system = "aarch64-darwin";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      }; in {
      darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            nixpkgs.hostPlatform = system;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.riweston = import ./home;
            home-manager.sharedModules = [
              # This links up home-manager enabled programs with Mac Applications
              # so that they can be opened from the Dock or Spotlight
              mac-app-util.homeManagerModules.default
            ];
          }
        ];
      };
    };
}
