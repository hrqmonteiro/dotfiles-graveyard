local g = vim.g

g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'NeogitStatus', 'gitcommit' }
g.indentLine_char = '▏'
g.indent_blankline_space_char=' '
g.indent_blankline_use_treesitter=true
g.indent_blankline_char_highlight = 'IndentLine'
g.indent_blankline_context_patterns = { 'class', 'return', 'function', 'method', 'ìf', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type' }

vim.api.nvim_exec (
[[
set listchars=eol:↴,nbsp:·,space:·,trail:·
set backspace=indent,eol,start

let g:indent_blankline_show_first_indent_level=v:true
let g:indent_blankline_show_trailing_blankline_indent=v:false
let g:indent_blankline_show_current_context = v:true

]], "")
