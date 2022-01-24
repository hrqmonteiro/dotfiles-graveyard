local colors = {
    base00  = "#657b83",
    base01  = "#586e75",
    base02  = "#073642",
    base03  = "#002732",
    base04  = "#00212B",
    -- base05  = "#00212A",
    base05  = "#base03",
    base0   = "#839496",
    base1   = "#93a1a1",
    base2   = "#eee8d5",
    base3   = "#fdf6e3",
    yellow  = "#b58900",
    orange  = "#cb4b16",
    red     = "#dc322f",
    magenta = "#d33682",
    violet  = "#6c71c4",
    blue    = "#268bd2",
    cyan    = "#2aa198",
    green   = "#719e07"
}

require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- DevIcon will be appended to `name`
    override = {
        -- ['.browserslistrc'] = {icon = "", color = colors.nord13, name = "browserslistrc" },
        -- ['.gitattributes'] = {icon = "", color = colors.nord11, name = "gitattributes" },
        -- ['.gitignore'] = {icon = "", color = colors.nord11, name = "configru" },
        -- ['.ruby-version'] = {icon = "", color = colors.nord3_bright, name = "rubyversion" },
        -- ['babel.config.js'] = {icon = "", color = colors.nord13, name = "babelconfigjs"},
        -- ['config.ru'] = {icon = "", color = colors.nord11, name = "configru" },
        -- ['yarn.lock'] = {icon = "", color = colors.nord9, name = "yarnlock" },
        ['next-env.d.ts'] = {icon = "", color = colors.yellow, name = 'nextenv'},
        -- lua = {icon = "", color = colors.nord9, name = "lua"},
        -- vim = {icon = "", color = colors.nord14, name = "vim"},
        -- css = {icon = "", color = colors.nord8, name = "css"},
        -- scss = {icon = "", color = colors.nord15, name = "scss"},
        -- html = {icon = "", color = colors.nord12, name = "html"},
        -- haml = {icon = "", color = colors.nord12, name = "haml"},
        -- erb = {icon = "", color = colors.nord11, name = "eruby"},
        -- js = {icon = "", color = colors.yellow, name = "js"},
        -- ts = {icon = "", color = colors.cyan, name = "ts"},
        -- jsx = {icon = "", color = colors.cyan, name = "jsx"},
        -- tsx = {icon = "", color = colors.cyan, name = "tsx"},
        -- json = {icon = "", color = colors.nord13, name = "json"},
        -- bundle = {icon = "", color = colors.nord11, name = "bundle"},
        -- rails = {icon = "", color = colors.nord11, name = "rails"},
        -- rake = {icon = "", color = colors.nord11, name = "rake"},
        -- setup = {icon = "", color = colors.nord11, name = "setup"},
        -- spring = {icon = "", color = colors.nord11, name = "spring"},
        -- yarn = {icon = "", color = colors.nord9, name = "yarn"},
        -- webpack = {icon = "", color = colors.nord8, name = "webpack"},
        -- ['webpack-dev-server'] = {icon = "", color = colors.nord8, name = "webpackdevserver"},
        -- Gemfile = {icon = "", color = colors.nord11, name = "Gemfile"},
        -- ['Gemfile.lock'] = {icon = "", color = colors.nord3_bright, name = "Gemfilelock"},
        -- Rakefile = {icon = "", color = colors.nord11, name = "configru" },
        -- rb = {icon = "", color = colors.nord11, name = "ruby"},
        -- ['README.md'] = {icon = "", color = colors.nord8, name = "readmemd"},
        -- NeogitStatus = {icon = "", color = colors.nord4, name = "NeogitStatus"},
        -- vue = {icon = "﵂", color = "#41B883", name = "vue" },
        -- py = {icon = "", color = colors.nord8, name = "python"},
    },
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true
}

