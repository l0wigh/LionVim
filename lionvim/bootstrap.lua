local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'L0Wigh/NeoSolarized'
	use '42Paris/42header'
	use{
		"catppuccin/nvim",
		as = "catppuccin"
	}
	use 'folke/tokyonight.nvim'
	use 'LunarVim/onedarker'

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
  if packer_bootstrap then
    require('packer').sync()
  end
end)
