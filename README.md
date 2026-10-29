## Description

This repo contains my dotfiles and Nix configuration for a macOS development environment.

Tools:

- [Nix](https://nixos.org/) for package management
- [nix-darwin](https://github.com/nix-darwin/nix-darwin) for macOS configuration
- [Home Manager](https://nix-community.github.io/home-manager/) for user configuration
- [nh](https://github.com/nix-community/nh) for build/switch ergonomics
- [devenv](https://devenv.sh/) for project-specific environments

## Installation

1. Install Nix ([nixos.org/download](https://nixos.org/download.html))
2. Clone this repo to `~/.dotfiles`
3. Update identity/settings as needed:
   - `flake.nix` (hostname, system)
   - `darwin/default.nix` (user / uid)
   - `home/programs/git.nix` (name, email, signing key)
4. Apply the configuration:
   ```bash
   nix run nix-darwin -- switch --flake ~/.dotfiles
   ```

## Day-to-day

Fish helpers (after install):

- `nos` — `nh darwin switch`
- `nob` — `nh darwin build`

Or run directly:

```bash
nh darwin switch          # build + activate
nh darwin switch --update # update flake inputs, then switch
nh darwin build           # build only
```

Homebrew packages upgrade on every switch. Nix flake inputs also update weekly
via a launchd agent (Monday 09:00) — see `darwin/auto-upgrade.nix`. Logs go to
`~/Library/Logs/nix-darwin-auto-upgrade.log`.

## Layout

- `darwin/` — nix-darwin system config + Homebrew (GUI apps as casks)
- `home/` — Home Manager user config
- `shared/cli-packages.nix` — CLI / language tooling
- `home/config/` — editable config files symlinked into `~/.config`

GUI apps are Homebrew casks on purpose: nix `copyApps` rewrites `.app` bundles on
every switch and can reset app state.
