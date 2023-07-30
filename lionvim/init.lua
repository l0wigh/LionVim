-- Basic vim config
vim.cmd [[
	set rtp+=~/.config/lionvim/
	set rtp-=~/.config/nvim/
	set signcolumn=yes
	set termguicolors
	set noshowmode
	set nowrap
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set noexpandtab
	set number
	set relativenumber
	set nohlsearch
	set incsearch
	set scrolloff=8
	set noswapfile
	set nobackup
	set undofile
	set undodir=~/.config/lionvim/undodir
	set list
	set listchars=tab:\∙\ 
	set timeoutlen=100
	set noerrorbells
	set cursorline
	set laststatus=3

	if exists("g:neovide")
		set guifont=JetBrains\ Mono:h16
		nmap <C-shift-c> "+y
		vmap <C-shift-c> "+y
		nmap <C-shift-v> "+p
	endif
	highlight CopilotSuggestion guifg=#2e5d7d ctermfg=8
]]

local packerpath = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if not vim.loop.fs_stat(packerpath) then
	vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		packerpath,
	})
end

require("plugins")
vim.cmd("PackerInstall")

require("keymaps")
require("lsp-config")
vim.cmd("colorscheme vanessa")

