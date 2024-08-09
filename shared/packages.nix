{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    eza
    fira-code
    fira-code-symbols
    devenv
    rustc
    cargo
  ];
}
