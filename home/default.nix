{ pkgs, config, ... }:

{
  imports = [
    ../options.nix
    ../shared/packages.nix
    ./xdg.config.nix
    ./programs/git.nix
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/vscode
  ];

  home.stateVersion = "24.05";

  # TODO: Don't think this is necessary
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # TODO: See if we can use SOPS to capture the encryption key to improve bootstrap QoL
    atuin.enable = true;
    atuin.flags = [ "--disable-up-arrow" ];
    bat.enable = true;
    eza.enable = true;
    fzf.enable = true;
    kitty.enable = true;
    wezterm.enable = true;
    zoxide.enable = true;
  };
}
