{ config, pkgs, nh_darwin, ... }:

let
  user = rec {
    username = "riweston";
    home = "/Users/${user.username}";
    shell = pkgs.fish;
    uid = 501;
  };
in {
  imports = [ ./homebrew.nix ];

  environment.systemPackages = [
    pkgs.home-manager
    nh_darwin.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.nix-output-monitor
    pkgs.nvd
  ];

  environment.shellAliases.nh = "nh_darwin";

  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.variables = { FLAKE = "/Users/${user.username}/.dotfiles"; };

  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
      trusted-users = [ "root" user.username ];
    };
  };

  programs = {
    gnupg.agent.enable = true;
    zsh.enable = true;
    fish.enable = true;

    # TODO: Pending this PR https://github.com/LnL7/nix-darwin/pull/942
    # nh = {
    #   enable = true;
    #   package = nh_darwin.packages.${pkgs.stdenv.hostPlatform.system}.default;
    # };
  };

  environment.variables.SHELL = "${pkgs.fish}/bin/fish";
  environment.shells = [ pkgs.fish ];

  users = {
    knownUsers = [ user.username ];
    users.riweston = {
      home = user.home;
      shell = user.shell;
      uid = user.uid;
    };
  };

  system.stateVersion = 4;

  fonts.packages = [ pkgs.atkinson-hyperlegible pkgs.jetbrains-mono ];
}
