{
  programs.git = {
    enable = true;
    userEmail = "github@riweston.io";
    userName = "riweston";
    extraConfig = {
      init.defaultBranch = "main";
      "url \"git@github.com:\"".insteadOf = "https://github.com";
    };
  };
}
