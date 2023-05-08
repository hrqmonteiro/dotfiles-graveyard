local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {}

local plugins = {
  -- colorschemes
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[ colorscheme vscode ]])
    end
  },
  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  -- lsp
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "windwp/nvim-autopairs",
  "jose-elias-alvarez/null-ls.nvim",
  -- editor
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" }}
  },
  -- treesitter
  "nvim-treesitter/nvim-treesitter",
  "windwp/nvim-ts-autotag",
}

require("lazy").setup(plugins, opts)
require("plugins.autopairs")
require("plugins.cmp")
require("plugins.lsp-config")
require("plugins.null-ls")
require("plugins.telescope")
require("plugins.treesitter")
