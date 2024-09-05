{ pkgs, ... }:

{
  home.packages = with pkgs; [
    niv
    nixfmt
    nvd
    nix-output-monitor
    nil
    ripgrep
    fira-code
    fira-code-symbols
    devenv
    rustc
    cargo
    restic
    rclone
    macfuse-stubs
    fuse
    jetbrains.goland
    google-cloud-sdk
    lazygit
    gh
    # TODO: this is a gui app and probably should be separated out from the other packages
    telegram-desktop
    nix-search-cli
    azure-cli
    prusa-slicer
    go
    raycast
    act
    colima
  ];
}
