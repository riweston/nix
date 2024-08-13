local color = require 'colors'
local keys = require 'keys'
local font = require 'font'

return {
    -- Color settings
    color_scheme = color.preferred_color_scheme,

    -- Key bindings
    keys = keys.bindings,

    -- Font settings
    font = font.main_font,
    font_size = font.size,

    window_background_opacity = 0.85,
    window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 10
    },

    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true
}
