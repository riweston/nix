{ config, pkgs, userSettings, ... }:

{
  imports = [ ./homebrew.nix ./auto-upgrade.nix ];

  environment.systemPackages = [
    pkgs.home-manager
    pkgs.nh
    pkgs.terraform
    pkgs.terraform-ls
  ];

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
    users.${userSettings.username} = {
      home = userSettings.homeDirectory;
      shell = userSettings.shell;
      uid = userSettings.uid;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  # General sudo still asks for auth; NOPASSWD rules below win for nh/activation
  # so the weekly auto-upgrade agent can run unattended.
  security.sudo.extraConfig = ''
    ${userSettings.username} ALL=(ALL) ALL
    ${userSettings.username} ALL=(ALL) NOPASSWD: /run/current-system/sw/bin/nh
    ${userSettings.username} ALL=(ALL) NOPASSWD: /run/current-system/sw/bin/darwin-rebuild
    ${userSettings.username} ALL=(ALL) NOPASSWD: /nix/store/*/activate
    ${userSettings.username} ALL=(ALL) NOPASSWD: /nix/store/*/activate-user
  '';

  # Match the Determinate/new Nix installer default (was 30000 on older installs)
  ids.gids.nixbld = 350;

  system.stateVersion = 4;
  system.primaryUser = userSettings.username;

  fonts.packages = [ pkgs.atkinson-hyperlegible pkgs.jetbrains-mono ];
}
