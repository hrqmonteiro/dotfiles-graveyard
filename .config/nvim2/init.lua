require 'keys'
require 'lsp'
require 'options'
require 'plugins'

vim.g.qs_enable = 0
vim.g.Illuminate_delay = 250

vim.cmd ([[
  set fillchars+=diff:╱
]], "")
