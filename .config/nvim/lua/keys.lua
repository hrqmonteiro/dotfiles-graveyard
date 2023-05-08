local map = vim.keymap

map.set('n', '<C-s>', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
