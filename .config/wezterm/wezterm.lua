local wezterm = require "wezterm"

local config = {
	color_scheme = "vscode-dark",
  color_scheme_dirs = { "/home/hrq/.config/wezterm/colorschemes" },
  enable_tab_bar = false,
	font = wezterm.font("Monaco Nerd Font"),
	font_size = 13,
	window_decorations = "NONE"
}

return config
