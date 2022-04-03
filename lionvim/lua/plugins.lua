require('packer').startup({function()
	use 'wbthomason/packer.nvim'

	use 'L0Wigh/NeoSolarized'
	use '42Paris/42header'
	use{
		"catppuccin/nvim",
		as = "catppuccin"
	}
	use 'folke/tokyonight.nvim'
	use 'LunarVim/onedarker'
	use 'sunjon/shade.nvim'

	use { "$HOME/.config/lionvim/liontools/", requires = { { "rcarriga/nvim-notify", "nvim-lua/popup.nvim", 'MunifTanjim/nui.nvim' } } }
	use  "$HOME/.config/lionvim/calc.nvim/"

	-- LSP Plugins Chain
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use { 'ms-jpq/coq_nvim', branch = 'coq' }
	use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
	use { 'ms-jpq/coq.thirdparty', branch = '3p' }
	use 'onsails/lspkind-nvim'
	use 'tami5/lspsaga.nvim'
	use 'matbme/JABS.nvim'
	use "windwp/nvim-autopairs"
	use {
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup{}
		end
	}
	use   {'lewis6991/hover.nvim', config = function()
		require('hover').setup{
			init = function()
				-- Require providers
				require('hover.providers.lsp')
				-- require('hover.providers.gh')
				-- require('hover.providers.man')
				-- require('hover.providers.dictionary')
			end,
			preview_opts = {
				border = nil
			},
			title = true
		}
	end}

	-- Lines and stuff
	use 'nvim-lualine/lualine.nvim'

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
require("plugins.jabs")
