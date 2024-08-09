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
  };

  outputs = inputs @ { self, nixpkgs, home-manager, darwin, nh_darwin, ... }:
    let

      hostname = "MAC-EVIDEN-NQK9H7JC54";
      system = "aarch64-darwin";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
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
          }
        ];
      };
    };
}
