require('packer').startup({function()
	use 'wbthomason/packer.nvim'

	use 'L0Wigh/NeoSolarized'
	use { "~/.config/lionvim/liontools/", requires = { {"rcarriga/nvim-notify"} } }

	-- LSP Plugins Chain
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {
		'ms-jpq/coq_nvim',
		branch = "coq"
	}
	use {
		'ms-jpq/coq.artifacts',
		branch = "artifacts"
	}
	use "windwp/nvim-autopairs"

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



end,
config = {
	display = {
		open_fn = require('packer.util').float,
	}
}})


require("plugins.nvimtree")
require("plugins.feline")
require("plugins.nvimcomment")
require("plugins.dashboard")
require("plugins.whichkey")
