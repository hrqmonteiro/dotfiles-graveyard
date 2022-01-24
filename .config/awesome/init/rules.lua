local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local keys = require("init.keys")

-- Determines that floating clientes should be centered
local centered_client_placement = function(c)
    return gears.timer.delayed_call(function()
        awful.placement.centered(c,
                                 {honor_padding = true, honor_workarea = true})
    end)
end

rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            buttons = clientbuttons,
            focus = awful.client.focus.filter,
            honor_padding = true,
            honor_workarea = true,
            keys = clientkeys,
            maximized = false,
            maximized_horizontal = false,
            maximized_vertical = false,
            placement = floating_client_placement,
            raise = true,
            screen = awful.screen.focused,
            size_hints_honor = false
        }
    }, 

    -- Add titlebars to normal clients and dialogs
    {
        rule_any = {
            type = {
                "normal",
                "dialog"
            },
            role = {
                "conversation"
            }
        },
        properties = {
            titlebars_enabled = true
        }
    },

    -- Clients with titlebars off
    {
        rule_any = {
            class = {
                "ck2",
                "photoshop.exe",
                "Chromium",
                "Brave-browser",
                "Firefox",
                "LibreWolf",
                "Steam"
            },
            type = {
                "splash"
            }
        },
        properties = {
            titlebars_enabled = false
        }
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                "copyq", -- Includes session name in class.
                "Devtools",
                "floating_terminal",
                "pinentry"
            },
            class = {
                "Galculator",
                "Gpick",
                "KeePassXC",
                "KeeWeb",
                "Lxappearance",
                "mpv",
                "Mousepad",
                "Nextcloud",
                "Nitrogen",
                "Pavucontrol",
                "SimpleScreenRecorder",
                "Sxiv",
                "Viewnior",
                "Zathura"
            },
            name = {
                "Event Tester", -- xev.
                "Friends List", -- Steam friends list,
                "MetaMask Notification"
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "GtkFileChooserDialog",
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            },
            type = {
                "dialog"
            }
        },
        properties = {
            floating = true,
            placement = centered_client_placement
        }
    },

    -- Fixed terminal geometry for floating terminals
    {
        rule_any = {
            class = {
                "floating_terminal",
            }
        },
        properties = {
            width = screen_width * 0.45,
            height = screen_height * 0.5,
            placement = centered_client_placement
        }
    },

    -- Fullscreen clients
    {
        rule_any = {
            class = {
                "Kodi",
                "dota2"
            },
            instance = {
                "synthetik.exe"
            }
        },
        properties = {
            fullscreen = true
        }
    },

    -- Start application on specific workspace
    -- [1] Browsing
    {
        rule_any = {
            class = {
                "firefox",
                "Brave-browser",
                "LibreWolf",
                "Navigator"
            }
        },
        except_any = {
            role = {
                "GtkFileChooserDialog"
            },
            instance = {
                "Toolkit"
            },
            type = {
                "dialog"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[1]
        }
    },

    -- [2] Coding/Full-Screen Terminals
    {
        rule_any = {
            class = {
                "alacritty",
                -- "kitty",
                -- "Code - OSS",
                -- "Emacs"
            }
        },
        except_any = {
            class = {
                "floating_terminal"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[2],
            switchtotag = true
        }
    },

    -- [3] File Managers
    {
        rule_any = {
            class = {
                "Nemo"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[3],
            switchtotag = true
        }
    },

    -- [4] Joplin
    {
        rule_any = {
            class = {
                "Joplin"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[4]
        }
    },

    -- [5] Graphics
    {
        rule_any = {
            class = {
                "fontforge",
                "Gimp",
                "Inkscape"}
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[5]
        }
    },

    -- [6] Messaging/Social
    {
        rule_any = {
            class = {
                "discord",
                "Element",
                "TelegramDesktop",
                "Whalebird"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[6]
        }
    },

    -- [7] Slack
    {
        rule_any = {
            class = {
                "Slack"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[7]
        }
    },

    -- [8] Games
    {
        rule_any = {
            class = {
                "Steam"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[8],
            switchtotag = true
        }
    },

    -- [9] Music
    -- TODO Why does Spotify won't init on the designated workspace?
    {
        rule_any = {
            class = {
                "Spotify"
            },
            name = {
                "Spotify Premium"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[9]
        }
    },

    -- [10] Misc
    {
        rule_any = {
            class = {
                "torrent",
                "Transmission",
            },
            instance = {
                "torrent"
            }
        },
        except_any = {
            type = {
                "dialog"
            }
        },
        properties = {
            screen = 1,
            tag = awful.screen.focused().tags[10]
        }
    },
}

awful.rules.rules = rules
