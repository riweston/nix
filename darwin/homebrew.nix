{
  homebrew = {
    enable = true;

    onActivation = {
      # Remove formulae/casks no longer in the Brewfile (including cask leftovers)
      cleanup = "zap";
    };

    # mas >= 7 required for App Store installs on current macOS
    brews = [ "docker" "mas" ];

    casks = [
      "azure-cli" # moved from formula → cask
      "bartender"
      "whatsapp"
      "macfuse"
      "discord"
    ];

    masApps = {
      "Things" = 904280696;
      "Amphetamine" = 937984704;
    };
  };
}
