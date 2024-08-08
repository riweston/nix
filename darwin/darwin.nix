{ pkgs, nh_darwin, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.home-manager
    nh_darwin.packages.${pkgs.system}.default
  ];

  # Alias for nh_darwin
  environment.shellAliases.nh = "${nh_darwin.packages.${pkgs.system}.default}/bin/nh";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "riweston" ];
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    gnupg.agent.enable = true;
    zsh.enable = true;  # default shell on catalina
    fish.enable = true;
  };

  environment.variables.SHELL = "${pkgs.fish}/bin/fish";
  environment.shells = [ pkgs.fish ];
  users = {
    knownUsers = [ "riweston" ];
    users = {
      riweston = {
        home = "/Users/riweston";
        shell = pkgs.fish;
        uid = 501;
        packages = with pkgs; [
          devenv
          rustc
          cargo
        ];
      };
    };
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  fonts.packages = [
    pkgs.atkinson-hyperlegible
    pkgs.jetbrains-mono
  ];

  homebrew = {
    enable = true;

    brews = [
        "gh"
        "docker"
        "lazygit"
    ];

    casks = [
      "bartender"
      "iterm2"
      "goland"
      "google-cloud-sdk"
      "whatsapp"
      "alfred"
      "alacritty"
    ];

    masApps = {
      "Things" = 904280696;
    };
  };
}
