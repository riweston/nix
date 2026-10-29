{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix tooling
    niv
    nixfmt
    nvd
    nix-output-monitor
    nil
    nix-search-cli
    devenv
    devbox

    # CLI utilities
    ripgrep
    doggo
    lazygit
    gh
    act
    restic
    rclone

    # Languages / runtimes
    rustc
    cargo
    go
    nodejs
    powershell
    powershell-editor-services

    # Cloud CLIs
    google-cloud-sdk
    # azure-cli: broken on nixpkgs-unstable (fabric/invoke); Homebrew cask in darwin/homebrew.nix

    # Fonts used by terminal tooling
    fira-code
    fira-code-symbols
  ];
}
