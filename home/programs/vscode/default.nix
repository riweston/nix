{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    userSettings = builtins.fromJSON (builtins.readFile ./user.settings.json);
  };
}
