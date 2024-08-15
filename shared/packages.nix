{ pkgs, ... }:

{
  home.packages = with pkgs; [
    niv
    nixfmt
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
  ];
}
