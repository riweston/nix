{
  # GUI apps live in darwin/homebrew.nix (casks) to avoid copyApps state resets.
  imports = [ ./cli-packages.nix ];
}
