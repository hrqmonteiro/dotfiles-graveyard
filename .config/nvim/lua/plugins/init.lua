require('plugins.autopairs')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.cmp')
require('plugins.toggleterm')
require('plugins.treesitter')
require('plugins.comment')
require('plugins.gitsigns')
require('plugins.indentblankline')

vim.cmd [[packadd packer.nvim]]                                                               
return require('packer').startup(function()                                                   
  use 'wbthomason/packer.nvim'                                                                
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'sainnhe/everforest'                                                                    
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }
  use 'TimUntersberger/neogit'
  use 'windwp/nvim-autopairs'
  use 'akinsho/toggleterm.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  -- use 'windwp/nvim-ts-autotag'
  use 'folke/tokyonight.nvim'
  use 'catppuccin/nvim'
  use 'numToStr/Comment.nvim'
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'ishan9299/nvim-solarized-lua'
    use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'arcticicestudio/nord-vim'

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
end)                                                                                          
