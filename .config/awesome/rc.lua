-- ______  _____   _     _   _  ___  
-- | ___ \/  __ \ | |   | | | |/ _ \ 
-- | |_/ /| /  \/ | |   | | | / /_\ \
-- |    / | |     | |   | | | |  _  |
-- | |\ \ | \__/\_| |___| |_| | | | |
-- \_| \_| \____(_)_____/\___/\_| |_/

local awesome_themes = {
  "nord",
  "tokyonight",
  "solarized",
  "whitesur"
}

local awesome_theme = awesome_themes[1]

local icon_themes = {
  "drops",
  "delta",
}

local icon_theme = icon_themes[2]

local panel_themes = {
  "manta",
  "lovelace",
  "skyfall",
  "ephemeral",
  "amarena"
}

local panel_theme = panel_themes[5]

local dashboard_themes = {
  "skyfall",        -- 1 --
  "amarena",        -- 2 -- Displays coronavirus stats
}

local dashboard_theme = dashboard_themes[2]

user = {
  browser = "firefox",
  file_manager = "nemo",
  editor = "kitty -1 --class editor -e nvim",
  uieditor = "code-oss",
  floating_terminal = "kitty -1 --class floating_terminal",
  openweathermap_key = "818aba7659f38603d4a86c62311260c7",
  openweathermap_city_id = "6322577",
  dirs = {
    downloads = os.getenv("XDG_DOWNLOAD_DIR") or "~/Downloads",
    documents = os.getenv("XDG_DOCUMENTS_DIR") or "~/Documents",
    music = os.getenv("XDG_MUSIC_DIR") or "~/Music",
    pictures = os.getenv("XDG_PICTURES_DIR") or "~/Pictures",
    videos = os.getenv("XDG_VIDEOS_DIR") or "~/Videos",
    -- Make sure the directory exists so that your screenshots
    -- are not lost
    screenshots = os.getenv("XDG_SCREENSHOTS_DIR") or "~/Pictures/Screenshots",
  },
  sidebar = {
    hide_on_mouse_leave = true,
    show_on_mouse_screen_edge = true
  },
  terminal = "kitty -1",
  weather_units = "metric",
}

awful = require("awful")
require("awful.autofocus")
require("init.keys")

local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")
naughty.config.defaults['icon_size'] = 130
local wibox = require("wibox")
local xrdb = beautiful.xresources.get_current_theme()

dpi = beautiful.xresources.apply_dpi
x = {
  background = xrdb.background,
  foreground = xrdb.foreground,
  color0 = xrdb.color0,
  color1 = xrdb.color1,
  color2 = xrdb.color2,
  color3 = xrdb.color3,
  color4 = xrdb.color4,
  color5 = xrdb.color5,
  color6 = xrdb.color6,
  color7 = xrdb.color7,
  color8 = xrdb.color8,
  color9 = xrdb.color9,
  color10 = xrdb.color10,
  color11 = xrdb.color11,
  color12 = xrdb.color12,
  color13 = xrdb.color13,
  color14 = xrdb.color14,
  color15 = xrdb.color15
}

local awesome_theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/" ..
awesome_theme .. "/"
beautiful.init(awesome_theme_dir .. "theme.lua")

local icons = require("components.icons")
icons.init(icon_theme)

require("components.panels." .. panel_theme)
require("components.panels.sidebar")
require("elemental.dashboard." .. dashboard_theme)
require("init.daemons")

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err)
    })
    in_error = false
  end)
end

-- Get screen geometry
-- I am using a single screen setup and I assume that screen geometry will not
-- change during the session.
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- Layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  awful.layout.suit.spiral,
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  awful.layout.suit.max.fullscreen,
  awful.layout.suit.magnifier,
  awful.layout.suit.corner.nw,
  awful.layout.suit.corner.ne,
  awful.layout.suit.corner.sw,
  awful.layout.suit.corner.se
}

-- Tags
awful.screen.connect_for_each_screen(function(s)
  -- Each screen has its own tag table.
  local l = awful.layout.suit -- Alias to save time :)
  -- Tag layouts
  local layouts = {
    l.tile,
    l.tile,
    l.floating,
    l.tile,
    l.tile,
    l.tile,
    l.tile,
    l.tile,
    l.tile,
    l.tile
  }

  -- Tag names
  local tagnames = beautiful.tagnames or {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}

  -- Create all tags at once (without seperate configuration for each tag)
  awful.tag(tagnames, s, layouts)

  -- Create tags with seperate configuration for each tag
  -- awful.tag.add(tagnames[1], {
  --     layout = layouts[1],
  --     screen = s,
  --     master_width_factor = 0.6,
  --     selected = true,
  -- })
end)

-- Rules
require("init.rules")

-- Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end
  if awesome.startup and not c.size_hints.user_position and
    not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- Titlebars
client.connect_signal("request::titlebars", function(c)
  local titlebar = awful.titlebar(c, {
    position = beautiful.titlebar_position,
    size = beautiful.titlebar_size
  })

  local buttons = gears.table.join(awful.button({}, 1, function()
    c:emit_signal("request::activate", "titlebar", {raise = true})
    awful.mouse.client.move(c)
  end), awful.button({}, 3, function()
  c:emit_signal("request::activate", "titlebar", {raise = true})
  awful.mouse.client.resize(c)
end))

local keycommand = wibox.widget {
  text = " הּ ",
  font = "Iosevka Nerd Font Bold 11",
  widget = wibox.widget.textbox
}

local applecommand = wibox.widget {
  text = " גּ ",
  font = "Iosevka Nerd Font Bold 11",
  widget = wibox.widget.textbox
}

local numcommand = wibox.widget {
  text = "1",
  font = "SF Pro Display Bold 12",
  widget = wibox.widget.textbox
}

titlebar:setup{
  {
    {
      wibox.layout.margin(awful.titlebar.widget.closebutton(c), dpi(0), dpi(0), dpi(0), dpi(0)),
      wibox.layout.margin(awful.titlebar.widget.minimizebutton(c), dpi(5), dpi(0), dpi(0), dpi(0)),
      wibox.layout.margin(awful.titlebar.widget.maximizedbutton(c), dpi(5), dpi(0), dpi(0), dpi(0)),
      layout = wibox.layout.fixed.horizontal,
      widget
    },
    {
      buttons = buttons,
      layout = wibox.layout.flex.horizontal
    },
    {
      layout = wibox.layout.fixed.horizontal,
      widget
    },
    layout = wibox.layout.align.horizontal
  },
  widget = wibox.container.margin,
  left = 14,
  right = 12,
  top = 10,
  bottom = 9
} 
end)

-- Autostart applications
awful.spawn.with_shell(os.getenv("HOME") .. "/.config/awesome/init/autostart.sh")

awful.spawn.with_shell(
'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
'xrdb -merge <<< "awesome.started:true";' ..
-- list each of your autostart commands, followed by ; inside single quotes, followed by ..
'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
