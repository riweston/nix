{ lib, ... }:
let
  gitIgnoreList = lib.filter (line: line != "")
    (lib.splitString "\n" (builtins.readFile ../config/git/ignore));
in {
  programs.git = {
    enable = true;
    signing = {
      key =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFkdiLoP3qUGu15NsK9/Z8hTeeU7cXb3doUAcwXr0Oiy";
      signByDefault = true;
      format = "ssh";
      signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    };
    settings = {
      user = {
        email = "github@riweston.io";
        name = "riweston";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
      url."ssh://git@github.com/".insteadOf = "https://github.com/";
    };
    ignores = gitIgnoreList;
  };
}
