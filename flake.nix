{
  description = "Lifted from https://github.com/evantravers/dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    nh_darwin.url = "github:ToyVo/nh_darwin";
  };

  outputs = {
    darwin,
    home-manager,
    nh_darwin,
    ...
  } @ inputs: {
    darwinConfigurations = {
      "NQK9H7JC54" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit inputs home-manager nh_darwin;
        };
        modules = [
          ./darwin/darwin.nix
          home-manager.darwinModules.home-manager
          {
            _module.args = { inherit inputs; };
            home-manager = {
              users.riweston = import ./home-manager/home.nix;
            };
            users.users.riweston.home = "/Users/riweston";
          }
        ];
      };
    };
  };
}
