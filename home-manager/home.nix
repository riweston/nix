{ pkgs, lib, ... }:

{
#   imports = [
#     ./nvim.nix
#     ./tmux.nix
#     ./git.nix
#     ./wezterm.nix
#   ];

  # Allow packages that are not free software.
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;


  home = {
    stateVersion = "24.05"; # Please read the comment before changing.


    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      ripgrep
      eza
      fira-code
      fira-code-symbols
    ];

    sessionVariables = {};
  };

  programs = {
    git = {
      enable = true;
      userEmail = "github@riweston.io";
      userName = "riweston";
      extraConfig = {
        init.defaultBranch = "main";
        "url \"git@github.com:\"".insteadOf
          = "https://github.com";
      };
    };
    # Use fish
    fish = {
      enable = true;

      interactiveShellInit = ''
        set fish_greeting # N/A
      '';

      shellInit = ''
        # Setup brew in fish
        /opt/homebrew/bin/brew shellenv | source
      '';


      plugins = [
      ];
    };

    alacritty = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    bat.enable = true;

    starship = {
      enable = true;

      settings = {
        command_timeout = 100;
        format = "[$all](dimmed white)";

        character = {
          success_symbol = "[❯](dimmed green)";
          error_symbol = "[❯](dimmed red)";
        };

        git_status = {
          style = "bold yellow";
          format = "([$all_status$ahead_behind]($style) )";
        };

        jobs.disabled = true;
      };
    };
  };
}
