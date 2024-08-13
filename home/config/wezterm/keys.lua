local wezterm = require 'wezterm'

local M = {}

M.bindings = { -- Pane management
{
    key = "d",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal {
        domain = "CurrentPaneDomain"
    }
}, {
    key = "d",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitVertical {
        domain = "CurrentPaneDomain"
    }
}, {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane {
        confirm = true
    }
}, -- Pane navigation with arrow keys
{
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Left")
}, {
    key = "DownArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Down")
}, {
    key = "UpArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Up")
}, {
    key = "RightArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Right")
} -- Other key bindings...
}

return M
