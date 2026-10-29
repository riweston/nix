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
    # azure-cli is broken on nixpkgs-unstable (fabric requires invoke<3, got 3.0.3)
    # Installed via Homebrew instead — see darwin/homebrew.nix

    # Fonts used by terminal tooling
    fira-code
    fira-code-symbols
  ];
}
