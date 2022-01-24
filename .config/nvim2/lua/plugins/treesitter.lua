require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "lua",
    "json",
    "jsonc",
  },
  highlight = { enable = true,
  disable = { "html" },
  },
  indent = { enable = true },
  autotag = { enable = true },
  rainbow = {
    enable = true,
    colors = {
      "#EBCB8B",
      "#D08770",
      "#BF616A",
      "#A3BE8C",
      "#B48EAD",
      "#8FBCBB",
      "#81A1C1",
    }
  }
}

require('nvim-ts-autotag').setup()
