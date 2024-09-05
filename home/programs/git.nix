{ config, lib, pkgs, ... }:
let
  gitignoreTemplates =
    [ "macos" "windows" "linux" "visualstudiocode" "jetbrains+all" ];

  # Join the templates into a comma-separated string
  templateString = builtins.concatStringsSep "," gitignoreTemplates;

  # Fetch gitignore content from Toptal API using curl
  gitignoreContent = builtins.readFile
    (pkgs.runCommand "gitignore-content" { } ''
      ${pkgs.curl}/bin/curl -k -L "https://www.toptal.com/developers/gitignore/api/${templateString}" > $out
    '');

  # Split the content into lines and filter out empty lines
  gitIgnoreList =
    lib.filter (line: line != "") (lib.splitString "\n" gitignoreContent);

in {
  programs.git = {
    enable = true;
    userEmail = "github@riweston.io";
    userName = "riweston";
    extraConfig = {
      init.defaultBranch = "main";
      url = {
        "ssh://git@github.com/" = { insteadOf = "https://github.com/"; };
      };
    };
    ignores = gitIgnoreList;
  };
}
