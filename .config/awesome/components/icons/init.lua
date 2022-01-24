local gears = require("gears")
local il = "/home/hrq/.config/awesome/components/icons/delta/"

local function file_exists(path)
    -- Try to open it
    local f = io.open(path)
    if f then
        f:close()
        return true
    end
    return false
end

local icons = {}
icons.image = {}
icons.text = {}

-- TODO Set up weather text icons here instead of in ../noodle/text_weather.lua
-- icons.text.weather = {}

-- Set up text symbols and accent colors to be used in tasklists or docks
-- instead of awful.widget.clienticon
-- Based on the client's `class` property
-- TODO Ability to match using rules instead of just class
icons.text.by_class = {
    -- Terminals
    ['Alacritty'] = { symbol = il .. "firefox.svg", color = x.color3 },
    ['android-studio'] = { symbol = il .. "android-studio.svg", color = x.color3 },
    ['Emacs'] = { symbol = il .. "emacs.svg", color = x.color3 },
    ['Nemo'] = { symbol = il .. "file-manager.svg", color = x.color3 },
    ['Gpick'] = { symbol = il .. "gpick.svg", color = x.color3 },
    ['kitty'] = { symbol = il .. "kitty.svg", color = x.color3 },
    ['spotify'] = { symbol = il .. "spotify.svg", color = x.color3 },
    ['Code - OSS'] = { symbol = il .. "visual-studio-code.svg", color = x.color3 },
    ['Firefox'] = { symbol = il .. "firefox.svg", color = x.color3 },
    ['neovim'] = { symbol = il .. "neovim.svg", color = x.color3 },

    -- Default
    ['_'] = { symbol = "", color = x.color7.."99" }
}

-- Available icons
local image_icon_names = {
    "playerctl_toggle",
    "playerctl_prev",
    "playerctl_next",
    "stats",
    "search",
    "volume",
    "muted",
    "firefox",
    "youtube",
    "reddit",
    "discord",
    "telegram",
    "steam",
    "games",
    "files",
    "manual",
    "keyboard",
    "appearance",
    "editor",
    "redshift",
    "gimp",
    "terminal",
    "mail",
    "music",
    "temperature",
    "battery",
    "battery_charging",
    "cpu",
    "compositor",
    "start",
    "ram",
    "screenshot",
    "home",
    "alarm",
    "alarm_off",
    "alert",
    "submenu",
    -- Weather icons
    "cloud",
    "dcloud",
    "ncloud",
    "sun",
    "star",
    "rain",
    "snow",
    "mist",
    "storm",
    "whatever",
    -- Exit screen icons
    "exit",
    "poweroff",
    "reboot",
    "suspend",
    "lock",
}

-- Path to icons
local p

-- Assumes all the icon files end in .png
-- TODO maybe automatically detect icons in icon theme directory
local function set_image_icon(icon_name)
    local i = p..icon_name..".png"
    icons.image[icon_name] = i
end

-- Set all the icon variables
function icons.init(theme_name)
    -- Set the path to image icons
    p = gears.filesystem.get_configuration_dir().."icons/"..theme_name.."/"

    for i = 1, #image_icon_names do
        set_image_icon(image_icon_names[i])
    end

    -- Set symbols and accent colors for text icons
end

return icons
