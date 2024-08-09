{ pkgs, ... }:

{
  imports = [
    ./programs/git.nix
    ./programs/fish.nix
    ./programs/alacritty.nix
    ./programs/starship.nix
    ../shared/packages.nix
  ];

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    bat.enable = true;
  };
}
