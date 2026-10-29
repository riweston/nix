{
  homebrew = {
    enable = true;

    onActivation = {
      # Remove formulae/casks no longer in the Brewfile (including cask leftovers)
      cleanup = "zap";
    };

    taps = [
      { name = "tangency-labs/tap"; trusted = true; }
      { name = "riweston/aztx"; trusted = true; }
    ];

    # mas >= 7 required for App Store installs on current macOS
    brews = [ "docker" "mas" ];

    # Prefer brew casks for GUI apps — nix copyApps rewrites .app bundles on
    # every switch and can reset app state (seen with Raycast).
    casks = [
      "1password"
      "1password-cli"
      "azure-cli"
      "bartender"
      "cursor"
      "discord"
      "macfuse"
      "obsidian"
      "raycast"
      "scroll-reverser"
      "smoothscroll"
      "telegram"
      "visual-studio-code"
      "whatsapp"
      "xbar"
      "tangency-labs/tap/solidcraft"
    ];

    masApps = {
      "Things" = 904280696;
      "Amphetamine" = 937984704;
    };
  };
}
