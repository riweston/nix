{ config, ... }:

{
  xdg.configFile."wezterm".source = config.lib.file.mkOutOfStoreSymlink
    "${config.dotfiles}/home/config/wezterm";
  xdg.configFile."wezterm".recursive = true;
  xdg.configFile."wezterm/wezterm.lua".enable = false;

  xdg.configFile."fish/functions".source = config.lib.file.mkOutOfStoreSymlink
    "${config.dotfiles}/home/config/fish/functions";
}
