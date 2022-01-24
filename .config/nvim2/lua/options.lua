local apply_options = require("apply").apply_options
local cmd = vim.cmd
local g = vim.g

vim.cmd([[
autocmd ColorScheme * highlight NvimTreeBg guibg=#323846 guifg=#D8DEE9 gui=none | highlight CursorLineNvimTree guibg=#88C0D0 guifg=#2E3440 gui=none
autocmd FileType NvimTree setlocal winhighlight=CursorLine:CursorLineNvimTree
]])

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

cmd('set shortmess+=c')
cmd('set ts=4')
cmd('set colorcolumn=99999')
cmd 'set termguicolors'
cmd 'syntax on'
-- vim.cmd("let g:gruvbox_contrast_dark= 'hard'")
vim.cmd('let g:everforest_background="hard"')
vim.cmd('let ayucolor="mirage"')
cmd 'colorscheme nord'
cmd 'hi DiagnosticError guifg=#BF616A'
cmd 'hi DiagnosticWarn guifg=#D08770'
cmd 'hi DiagnosticInformation guifg=#EBCB8B'
cmd 'hi DiagnosticHint guifg=#A3BE8C'
vim.cmd('highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080')
vim.cmd('highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6')
vim.cmd('highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6')
vim.cmd('highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0')
vim.cmd('highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0')
vim.cmd('highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4')
-- vim.cmd('hi Normal guibg=#272C36')
-- vim.cmd('hi VertSplit guibg=#272C36')
-- vim.cmd('hi StatusLine guibg=#272C36')
-- vim.cmd('hi StatusLineNC guibg=#272C36')
-- vim.cmd('hi SignColumn guibg=#272C36')
-- cmd 'hi Normal guibg=none'
-- cmd 'hi CursorLine guibg=#1E2029'
-- cmd 'hi CursorLineNr gui=bold guibg=#002732'
-- cmd 'hi LineNr guibg=#002732'
-- cmd 'hi TSConstructor guifg=#B58900'
-- cmd 'hi TSInclude guifg=#268bd2'
-- cmd 'hi TSNumber guifg=#6c71c4'
-- cmd 'hi TSString guifg=#859900'
-- cmd 'hi TSTag guifg=#717E07'
-- cmd 'hi TSTagDelimiter guifg=#586e75'
-- cmd 'hi Normal guibg=#22212C'
-- cmd 'hi Normal guibg=#252631'
cmd 'set updatetime=250'

vim.cmd ([[
  let g:nnn#shell = 'bash'
]], "")

-- Emmet
g.user_emmet_mode = 'a'
g.user_emmet_leader_key = '<C-X>'
