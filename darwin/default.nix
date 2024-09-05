{ config, pkgs, nh_darwin, userSettings, ... }:

{
  imports = [ ./homebrew.nix ];

  environment.systemPackages = [
    pkgs.home-manager
    nh_darwin.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  environment.shellAliases.nh = "nh_darwin";

  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
      trusted-users = [ "root" userSettings.username ];
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

  services.dnsmasq.enable = true;
  services.dnsmasq.addresses = import ./config/dnsmasq.nix;

  environment.variables.SHELL = "${pkgs.fish}/bin/fish";
  environment.shells = [ pkgs.fish ];

  users = {
    knownUsers = [ userSettings.username ];
    users.riweston = {
      home = userSettings.homeDirectory;
      shell = userSettings.shell;
      uid = userSettings.uid;
    };
  };

  security.sudo.extraConfig = ''
    ${userSettings.username} ALL=(ALL) ALL
  '';

  system.stateVersion = 4;

  fonts.packages = [ pkgs.atkinson-hyperlegible pkgs.jetbrains-mono ];
}
