{ pkgs, userSettings, ... }:

{
  launchd.user.agents.nix-darwin-auto-upgrade = {
    path = [
      pkgs.nh
      pkgs.git
      pkgs.nix
      "/run/current-system/sw/bin"
      "/etc/profiles/per-user/${userSettings.username}/bin"
    ];

    script = ''
      set -euo pipefail
      LOG="$HOME/Library/Logs/nix-darwin-auto-upgrade.log"
      mkdir -p "$(dirname "$LOG")"
      exec >>"$LOG" 2>&1

      echo "===== $(date) starting ====="
      cd "${userSettings.homeDirectory}/.dotfiles"
      export NH_FLAKE="${userSettings.homeDirectory}/.dotfiles"

      # Update flake inputs and activate. Leaves flake.lock dirty for you to commit.
      # --elevation-strategy passwordless relies on NOPASSWD rules in darwin/default.nix.
      nh darwin switch --update --elevation-strategy passwordless

      echo "===== $(date) done ====="
    '';

    serviceConfig = {
      # Monday 09:00 local time
      StartCalendarInterval = [{
        Weekday = 1;
        Hour = 9;
        Minute = 0;
      }];
      RunAtLoad = false;
      ProcessType = "Background";
    };
  };
}
