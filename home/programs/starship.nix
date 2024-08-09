{
  programs.starship = {
    enable = true;

    settings = {
      command_timeout = 100;
      format = "[$all](dimmed white)";

      character = {
        success_symbol = "[❯](dimmed green)";
        error_symbol = "[❯](dimmed red)";
      };

      git_status = {
        style = "bold yellow";
        format = "([$all_status$ahead_behind]($style) )";
      };

      jobs.disabled = true;
    };
  };
}
