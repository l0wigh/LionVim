local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- Plugins in testing
	use 'tpope/vim-surround'
	-- use 'github/copilot.vim'
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

	use 'wbthomason/packer.nvim'

	use '42Paris/42header'

	-- Colorschemes
	use 'Mofiqul/vscode.nvim'
	use { 'L0Wigh/vanessa.nvim', requires = {'rktjmp/lush.nvim'} }
	-- use  '$HOME/projects/vanessa/'

	use { '$HOME/.config/lionvim/liontools/', requires = { { 'rcarriga/nvim-notify', 'nvim-lua/popup.nvim', 'MunifTanjim/nui.nvim' } } }
	use  '$HOME/.config/lionvim/calc.nvim/'
	use  '$HOME/.config/lionvim/lionpackages/'

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
	use 'windwp/nvim-autopairs'

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

	use 'terrortylor/nvim-comment'
	use 'folke/lsp-colors.nvim'
	use 'glepnir/dashboard-nvim'

	use 'folke/which-key.nvim'
	use 'mbbill/undotree'

	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
	use 'ray-x/lsp_signature.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
