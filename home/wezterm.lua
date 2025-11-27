local wezterm = require("wezterm")

local config = {}

config.color_scheme = "Catppuccin Mocha"
config.hide_mouse_cursor_when_typing = true
config.window_decorations = "RESIZE"
config.font_size = 16
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.use_fancy_tab_bar = false

config.keys = {
	{
		key = "LeftArrow",
		mods = "ALT",
		action = wezterm.action.SendString("\x1bb"),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = wezterm.action.SendString("\x1bf"),
	},
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
}

return config
