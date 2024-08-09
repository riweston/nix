{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # N/A
      # Setup brew in fish
      /opt/homebrew/bin/brew shellenv | source
    '';

    plugins = [
      # Add any fish plugins here
    ];
  };
}
