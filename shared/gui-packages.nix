{ pkgs, ... }:

{
  # GUI / desktop apps — kept separate so CLI-only breakage stays isolated
  home.packages = with pkgs; [
    jetbrains.goland
    telegram-desktop
    raycast
    colima
    obsidian
    vscode
    code-cursor
    xbar
    claude-code
  ];
}
