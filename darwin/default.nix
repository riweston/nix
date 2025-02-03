{ config, pkgs, userSettings, ... }:

{
  imports = [ ./homebrew.nix ];

  environment.systemPackages = [ pkgs.home-manager ];

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
  };

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
