vim.api.nvim_command('autocmd BufWritePre * lua vim.lsp.buf.format()')
