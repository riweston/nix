{
  homebrew = {
    enable = true;

    brews = [ "docker" ];

    casks = [
      "azure-cli" # moved from formula → cask
      "bartender"
      "whatsapp"
      "macfuse"
      "discord"
    ];

    # mas-cli currently fails on this macOS ("not supported... changes in macOS").
    # Install Things / Amphetamine from the App Store manually until mas works again.
    # masApps = {
    #   "Things" = 904280696;
    #   "amphetamine" = 937984704;
    # };
  };
}
