require('packer').startup({function()
	use 'wbthomason/packer.nvim'

	use 'L0Wigh/NeoSolarized'

	use { "$HOME/.config/lionvim/liontools/", requires = { { "rcarriga/nvim-notify", "nvim-lua/popup.nvim", 'MunifTanjim/nui.nvim' } } }
	use  "$HOME/.config/lionvim/calc.nvim/"

	-- LSP Plugins Chain
	use 'neovim/nvim-lspconfig'
	use 'LunarVim/onedarker'
	use 'williamboman/nvim-lsp-installer'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'theprimeagen/vim-be-good'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'onsails/lspkind-nvim'
	use {'tzachar/cmp-tabnine', run='./install.sh'}
	use "windwp/nvim-autopairs"
	use "github/copilot.vim"

	-- Lines and stuff
	use 'famiu/feline.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	}

	use "terrortylor/nvim-comment"
	use 'folke/lsp-colors.nvim'
	use 'glepnir/dashboard-nvim'

	use "folke/which-key.nvim"
	use "mbbill/undotree"

	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
	use "rafamadriz/friendly-snippets"
	use "ray-x/lsp_signature.nvim"



end,
config = {
	display = {
		open_fn = require('packer.util').float,
	}
}})

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
autocmd BufWritePost plugins.lua source <afile> | PackerInstall
augroup end
]])

require("plugins.nvimtree")
require("plugins.feline")
require("plugins.nvimcomment")
require("plugins.dashboard")
require("plugins.whichkey")
