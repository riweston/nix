## Description

This repo contains my dotfiles and nix configuration files to setup my development environment.

I use the following tools:

- [Nix](https://nixos.org/) for package management
- [nix-darwin](https://github.com/LnL7/nix-darwin) for macOS configuration
- [Home Manager](https://nix-community.github.io/home-manager/) for user configuration
- [devenv](https://devenv.sh/) Setup project specific development environments a nix-like way

## Installation

1. Install Nix by following the instructions at [nixos.org](https://nixos.org/download.html)
2. Clone this repo to `~/nix` or wherever you want
3. Update the following files with your information:
    - `./flake.nix` (hostname)
    - `./darwin/default.nix` (user{})
    - `./home/programs/git.nix` (name, email)
4. Run `nix run nix-darwin -- switch --flake ~/nix` to install the configuration
5. Once the installation is complete you can run any of the following commands:
    - `nh os switch` to build and switch to the latest configuration following any changes
    - `nh os build` to build the configuration without switching
    - Use the `--update` flag to update the configuration packages to the latest versions
