{ pkgs, config, userSettings, ... }:

{
  imports = [
    ../options.nix
    ../shared/packages.nix
    ./xdg.config.nix
    ./programs/git.nix
    ./programs/fish.nix
    ./programs/starship.nix
  ];

  home.stateVersion = "25.11";

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    LG_CONFIG_FILE = "${userSettings.homeDirectory}/.config/lazygit/config.yml";
  };

  services.ollama.enable = true;

  programs = {
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
    # TODO: See if we can use SOPS to capture the encryption key to improve bootstrap QoL
    atuin.enable = true;
    # Custom Ctrl-R is handled by atuin-setup (fzf + atuin); keep up-arrow free too
    atuin.flags = [ "--disable-up-arrow" "--disable-ctrl-r" ];
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
    nh = {
      enable = true;
      flake = "${userSettings.homeDirectory}/.dotfiles";
    };
    wezterm.enable = true;
    zoxide.enable = true;
  };
}
