require('plugins.webdevicons')
require('plugins.autopairs')
require('plugins.colorizer')
require('plugins.dashboard')
require('plugins.lspkind')
-- require('plugins.galaxyline')
require('plugins.lualine')
require('plugins.gitsigns')
-- require('plugins.lspsaga')
require('plugins.neogit')
-- require('plugins.nnn')
-- require('plugins.nord')
require('plugins.nvim-comment')
require('plugins.nvim-tree')
require('plugins.treesitter')
-- require('plugins.tokyonight')
require('plugins.indentblankline')

vim.cmd("packadd packer.nvim")
return require("packer").startup(function()
  use({ "wbthomason/packer.nvim", opt = true })

  use 'unblevable/quick-scope'
  use 'mattn/emmet-vim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'arcticicestudio/nord-vim'

  -- use 'glepnir/galaxyline.nvim'
  use "hoob3rt/lualine.nvim"
  use 'norcalli/nvim-colorizer.lua'
  use 'ojroques/vim-oscyank'
  use 'terrortylor/nvim-comment'
  use 'TimUntersberger/neogit'
  use 'folke/tokyonight.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'sindrets/diffview.nvim'
  use 'psliwka/vim-smoothie'
  use 'NTBBloodbath/doom-one.nvim'
  use 'dracula/vim'

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Telescope 
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use "windwp/nvim-autopairs" -- autocomplete pairs

  --Lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/vim-vsnip-integ'
  use 'ahmedkhalf/lsp-rooter.nvim'
  use 'rafamadriz/friendly-snippets'
  use 'onsails/lspkind-nvim'
  use 'p00f/nvim-ts-rainbow'
  use 'kyazdani42/nvim-tree.lua'

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use 'windwp/nvim-ts-autotag'
end)
