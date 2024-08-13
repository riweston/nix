{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
  ];
}
