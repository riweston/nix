local wezterm = require 'wezterm'

local M = {}

M.main_font = wezterm.font_with_fallback({{
    family = "Fira Code",
    weight = "DemiBold"
}, {
    family = "Noto Color Emoji",
    scale = 0.75 -- Optionally scale the emoji font
}})

M.size = 14.0

-- Additional font-related settings
M.font_rules = {{
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}, {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({{
        family = "Fira Code",
        weight = "DemiBold"
    }})
}}

return M
