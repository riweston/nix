{ pkgs, config, userSettings, ... }:

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

  home.sessionVariables = {
    FLAKE = "${userSettings.homeDirectory}/.dotfiles";
  };

  programs = {
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
    # TODO: See if we can use SOPS to capture the encryption key to improve bootstrap QoL
    atuin.enable = true;
    atuin.flags = [ "--disable-up-arrow" ];
    bat.enable = true;
    bat.extraPackages = with pkgs.bat-extras; [
      batgrep
      batpipe
      batwatch
      batdiff
      prettybat
    ];
    eza.enable = true;
    fish.enable = true;
    fzf.enable = true;
    jq.enable = true;
    wezterm.enable = true;
    zoxide.enable = true;
  };
}
