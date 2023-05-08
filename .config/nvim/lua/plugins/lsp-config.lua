require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").ccls.setup {
  capabilities = capabilities,
  init_options = {
    cache = {
      directory = ".ccls-cache"
    }
  }
}

require("lspconfig").tsserver.setup {
  capabilities = capabilities
}
