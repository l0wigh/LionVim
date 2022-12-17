local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- needed to avoid issues with packer

	-- LionVim Tools
	use { '$HOME/.config/lionvim/lionplugs/liontools/', requires = { { 'rcarriga/nvim-notify', 'nvim-lua/popup.nvim', 'MunifTanjim/nui.nvim' } } }
	use  'L0Wigh/calc.nvim'

	-- Hop everywhere you want
	use {
		'phaazon/hop.nvim',
		branch = 'v1.3', -- optional but strongly recommended
		config = function()
			require'hop'.setup {
				keys = 'etovxqpdygfblzhckisuran',
				quit_key = '<Esc>'
			}
		end
	}

	-- Plugins in testing
	use {
		'lukas-reineke/indent-blankline.nvim'
	}
	use 'folke/trouble.nvim'


	use 'github/copilot.vim'
	use '42Paris/42header' -- Not required obviously

	-- Colorschemes
	-- use {'$HOME/projects/vanessa/', requires = {'rktjmp/lush.nvim'}}
	use { 'L0Wigh/vanessa.nvim', requires = {'rktjmp/lush.nvim'} }
	use { 'L0Wigh/zenith.nvim', requires = {'rktjmp/lush.nvim'} }

	-- LSP Plugins Chain
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	-- use 'hrsh7th/cmp-copilot'
	use 'L3MON4D3/LuaSnip'
	use "rafamadriz/friendly-snippets"
	use 'saadparwaiz1/cmp_luasnip'
	use 'williamboman/nvim-lsp-installer'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'onsails/lspkind-nvim'
	use 'tami5/lspsaga.nvim'
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
