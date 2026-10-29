{ config, pkgs, userSettings, ... }:

{
  imports = [ ./homebrew.nix ];

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

  security.sudo.extraConfig = ''
    ${userSettings.username} ALL=(ALL) ALL
  '';

  # Match the Determinate/new Nix installer default (was 30000 on older installs)
  ids.gids.nixbld = 350;

  system.stateVersion = 4;
  system.primaryUser = userSettings.username;

  fonts.packages = [ pkgs.atkinson-hyperlegible pkgs.jetbrains-mono ];
}
