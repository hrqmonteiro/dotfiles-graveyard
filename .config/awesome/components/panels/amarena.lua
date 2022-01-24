local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("init.helpers")
local keys = require("init.keys")

local dock_autohide_delay = 0.7 -- seconds

local dock = require("modules.dock")
local dock_placement = function(w)
    return awful.placement.bottom(w)
end

awful.screen.connect_for_each_screen(function(s)
    -- Create the dock wibox
    s.dock = awful.popup({
        -- Size is dynamic, no need to set it here
        visible = false,
        bg = beautiful.sidebar_bg,
        ontop = true,
        type = "dock",
        placement = awful.placement.bottom,
        widget = dock,
        shape = helpers.prrect(dpi(12), true, true, true, true),
    })
    -- dock_placement(s.dock)

    local popup_timer
    local autohide = function ()
        if popup_timer then
            popup_timer:stop()
            popup_timer = nil
        end
        popup_timer = gears.timer.start_new(dock_autohide_delay, function()
            popup_timer = nil
            s.dock.visible = false
        end)
    end

    -- Initialize wibox activator
    s.dock_activator = wibox({ screen = s, height = 1, bg = "#00000000", visible = true, ontop = true})
    awful.placement.bottom(s.dock_activator)
    s.dock_activator:connect_signal("mouse::enter", function()
        s.dock.visible = true
        if popup_timer then
            popup_timer:stop()
            popup_timer = nil
        end
    end)

    -- We have set the dock_activator to be ontop, but we do not want it to be
    -- above fullscreen clients
    local function no_dock_activator_ontop(c)
        if c.fullscreen then
            s.dock_activator.ontop = false
        else
            s.dock_activator.ontop = true
        end
    end
    client.connect_signal("focus", no_dock_activator_ontop)
    client.connect_signal("unfocus", no_dock_activator_ontop)
    client.connect_signal("property::fullscreen", no_dock_activator_ontop)

    s:connect_signal("removed", function (s)
        client.disconnect_signal("focus", no_dock_activator_ontop)
        client.disconnect_signal("unfocus", no_dock_activator_ontop)
        client.disconnect_signal("property::fullscreen", no_dock_activator_ontop)
    end)

    s.dock_activator:buttons(
        gears.table.join(
            awful.button({ }, 4, function ()
                awful.tag.viewprev()
            end),
            awful.button({ }, 5, function ()
                awful.tag.viewnext()
            end)
    ))

    local function adjust_dock()
        -- Reset position every time the number of dock items changes
        dock_placement(s.dock)

        -- Adjust activator width every time the dock wibox width changes
        s.dock_activator.width = s.dock.width + dpi(250)
        -- And recenter
        awful.placement.bottom(s.dock_activator)
    end

    adjust_dock()
    s.dock:connect_signal("property::width", adjust_dock)

    s.dock:connect_signal("mouse::enter", function ()
        if popup_timer then
            popup_timer:stop()
            popup_timer = nil
        end
    end)

    s.dock:connect_signal("mouse::leave", function ()
        autohide()
    end)
    s.dock_activator:connect_signal("mouse::leave", function ()
        autohide()
    end)
end)

awesome.connect_signal("elemental::dismiss", function()
    local s = mouse.screen
    s.dock.visible = false
end)

-- Every bar theme should provide these fuctions
function wibars_toggle()
    local s = awful.screen.focused()
    s.dock.visible = not s.dock.visible
end
