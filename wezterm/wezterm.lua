local wezterm = require 'wezterm';

return {
    default_prog = {"/usr/bin/zsh", "-l"},
    enable_scroll_bar = true,
    exit_behavior = "Hold",
    color_scheme = "Chalkboard",
    scrollback_lines = 10000,
    font_size = 11.8,
    font = wezterm.font({
        family = "SauceCodePro Nerd Font Mono",
    }),
    window_background_gradient = {
        orientation = {
            Radial = {
                cx = 1.0,
                cy = 1.0,
                radius = 1.2,
            }
        },
        colors = {
            "#000000",
            "#140028"
        },
        interpolation = "CatmullRom",
        blend = "Oklab"
    },
}
