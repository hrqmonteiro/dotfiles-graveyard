local apply_options = require("apply").apply_options
local cmd = vim.cmd
local g = vim.g

apply_options (
  {
    clipboard = "unnamedplus",
    cmdheight = 1,
    cursorline = true,
    expandtab = true,
    fillchars = "vert::",
    incsearch = true,
    hidden = true,
    laststatus = 2,
    -- linespace = 1,
    mouse = "nv",
    backup = false,
    showmode = false,
    swapfile = false,
    number = true,
    relativenumber = true,
    shiftwidth = 2,
    -- shortmess = "filnxtToOFIWc",
    signcolumn = "yes",
    smartindent = true,
    smarttab = true,
    syntax = "on",
    splitbelow = true,
    splitright = true,
    t_Co = "256",
    conceallevel = 1,
    wildmenu = true,
  }
)

cmd('set ts=2')
cmd('set termguicolors')
cmd('syntax on')
cmd('let g:everforest_background="hard"')
cmd('colorscheme norddeep')
cmd('set updatetime=250')
cmd("let &t_ut=''")
cmd 'hi Normal guibg=#242831'
-- cmd('hi SignColumn guibg=#2B3339 guifg=#2B3339')
-- cmd('hi VertSplit guifg=#2B3339')
-- cmd('hi GreenSign guibg=#2B3339')
-- cmd('hi RedSign guibg=#2B3339')
-- cmd('hi BlueSign guibg=#2B3339')
-- cmd('hi CursorLineNr guibg=#2B3339 gui=bold')
