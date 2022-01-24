require 'lsp'
require 'options'
require 'plugins'
require 'keys'


vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
