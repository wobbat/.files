-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = false
config.warn_about_missing_glyphs = false

config.font = wezterm.font('JetBrains Mono NF', { weight = 'Bold' })
config.font_size = 16.0
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.default_cursor_style = 'BlinkingBlock'
config.animation_fps = 1

-- Define colors
local colors = {
    none = "NONE",
    fg = "#b4b4b4",               -- Foreground text
    bg = "#000000",               -- Background color
    alt_bg = "#101010",           -- Alternate background (used in some UI elements)
    accent = "#202020",           -- Accent color (could be for things like borders)
    white = "#b4b4b4",            -- White
    gray = "#2c2c2c",             -- Gray
    medium_gray = "#5b5b5b",      -- Medium gray
    light_gray = "#8c8c8c",       -- Light gray
    blue = "#8297b3",             -- Blue
    gray_blue = "#7e4a3e",        -- Gray-blue
    medium_gray_blue = "#717f87", -- Medium gray-blue
    cyan = "#5f7a71",             -- Cyan
    green = "#65763e",            -- Green
    red = "#ab8652",              -- Red
    yellow = "#ab8652",           -- Yellow
    orange = "#b3733d",           -- Orange
    purple = "#77516f",           -- Purple
    magenta = "#77526f",          -- Magenta
    cursor_fg = "#151515",        -- Cursor foreground (usually black or very dark)
    cursor_bg = "#a6a6a6",        -- Cursor background (highlight)
    sign_add = "#546533",         -- Git sign add (for diff)
    sign_change = "#4b5e71",      -- Git sign change (for diff)
    sign_delete = "#8d4332",      -- Git sign delete (for diff)
    error = "#7a3a2b",            -- Error (e.g., error messages)
    warning = "#896a40",          -- Warning (e.g., warning messages)
    info = "#b3733d",             -- Info (e.g., info messages)
    hint = "#465968",             -- Hint (e.g., hints or suggestions)
    accent_blue = "#191a20",      -- Accent color for blue
    accent_green = "#1c2019",     -- Accent color for green
    accent_red = "#201919",       -- Accent color for red
}

config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- Set config.colors directly
config.colors = {
    -- Basic Colors
    foreground = colors.fg,
    background = colors.bg,
    cursor_fg = colors.bg,
    cursor_bg = colors.fg,
    cursor_border = colors.gray,


    selection_bg = colors.red,
    selection_fg = colors.alt_bg,

    -- ANSI colors (standard 8 colors)
    ansi = {
        colors.bg,               -- 0: Black
        colors.gray_blue,        -- 1: Red
        colors.sign_add,         -- 2: Green
        colors.medium_gray_blue, -- 4: Blue
        colors.warning,          -- 3: Yellow
        colors.magenta,          -- 5: Purple
        colors.cyan,             -- 6: Cyan
        colors.white,            -- 7: White
    },

    -- Bright ANSI colors (8 to 15)
    brights = {
        colors.gray,             -- 8: Bright Black (Gray)
        colors.sign_delete,      -- 9: Bright Red
        colors.green,            -- 10: Bright Green
        colors.medium_gray_blue, -- 12: Bright Blue
        colors.yellow,           -- 11: Bright Yellow
        colors.purple,           -- 13: Bright Purple
        colors.cyan,             -- 14: Bright Cyan
        colors.white,            -- 15: Bright White
    },

}


return config
