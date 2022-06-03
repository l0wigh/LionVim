require('packer').startup({function()
	use 'wbthomason/packer.nvim'

	use '42Paris/42header'

	use 'L0Wigh/NeoSolarized'
	use 'LunarVim/onedarker'
	use 'Mofiqul/vscode.nvim'

	use { "$HOME/.config/lionvim/liontools/", requires = { { "rcarriga/nvim-notify", "nvim-lua/popup.nvim", 'MunifTanjim/nui.nvim' } } }
	use  "$HOME/.config/lionvim/calc.nvim/"

	-- LSP Plugins Chain
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'williamboman/nvim-lsp-installer'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'onsails/lspkind-nvim'
	use 'tami5/lspsaga.nvim'
	use "windwp/nvim-autopairs"
	use {
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup{}
		end
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

	use "terrortylor/nvim-comment"
	use 'folke/lsp-colors.nvim'
	use 'glepnir/dashboard-nvim'

	use "folke/which-key.nvim"
	use "mbbill/undotree"

	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
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
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end

let g:user42 = 'thomathi'
let g:mail42 = 'thomathi@student.42mulhouse.fr'

]])


require("lspsaga").setup()

require("plugins.lualine")
require("plugins.nvimtree")
require("plugins.nvimcomment")
require("plugins.dashboard")
require("plugins.whichkey")
require("nvim-autopairs").setup{}
