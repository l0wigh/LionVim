require('packer').startup({function()
	use 'wbthomason/packer.nvim' -- needed to avoid issues with packer

	-- LionVim Tools
	use { '$HOME/.config/lionvim/lionplugs/liontools/', requires = { { 'rcarriga/nvim-notify', 'nvim-lua/popup.nvim', 'MunifTanjim/nui.nvim' } } }
	use  'L0Wigh/calc.nvim'

	-- Hop everywhere you want
	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
	}

	-- Plugins in testing
	use {
		'lukas-reineke/indent-blankline.nvim'
	}
	use 'github/copilot.vim'

	use '42Paris/42header' -- Not required obviously

	-- Colorschemes
	-- use {'$HOME/projects/vanessa/', requires = {'rktjmp/lush.nvim'}}
	use { 'L0Wigh/vanessa.nvim', requires = {'rktjmp/lush.nvim'} }
	use { 'L0Wigh/zenith.nvim', requires = {'rktjmp/lush.nvim'} }
	use 'LunarVim/TempleOS.nvim' -- Devine Intellect

	-- LSP Plugins Chain
	use 'neovim/nvim-lspconfig'
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "jose-elias-alvarez/null-ls.nvim"
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	-- use 'hrsh7th/cmp-copilot'
	use 'L3MON4D3/LuaSnip'
	use "rafamadriz/friendly-snippets"
	use 'saadparwaiz1/cmp_luasnip'
	use {
		'nvim-treesitter/nvim-treesitter',
	}
	use 'onsails/lspkind-nvim'
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = { {"nvim-tree/nvim-web-devicons"} }
	})
	use {
		"windwp/nvim-autopairs",
	}

	-- Lines and stuff
	use 'nvim-lualine/lualine.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	}

	use 'terrortylor/nvim-comment' -- easy comment with shortcuts
	use 'folke/lsp-colors.nvim' -- be sure to have lsp colors everywhere
	-- use { 'glepnir/dashboard-nvim', lock = true } -- old dashboard that is still working with LionVim config
	use 'L0Wigh/lionboard.nvim'

	use 'folke/which-key.nvim' -- pressing space to have shortcuts is great
	use 'mbbill/undotree' -- Undo > backup / swap

	-- just to be sure that I know what is opened
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use 'ray-x/lsp_signature.nvim' -- Little lion that help you with function signatures

	-- DAP
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'ChristianChiarulli/neovim-codicons'
	use 'jay-babu/mason-nvim-dap.nvim'

end,
config = {
	display = {
		open_fn = require('packer.util').float,
	}
}})
