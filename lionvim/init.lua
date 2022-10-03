-- Basic vim config
vim.cmd [[
	set rtp+=~/.config/lionvim/
	set rtp-=~/.config/nvim/
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
		"set guifont=VictorMono\ NF:h16
		" set guifont=Cozette:h14
		nmap <C-shift-c> "+y
		vmap <C-shift-c> "+y
		nmap <C-shift-v> "+p
	endif
	colorscheme vanessa
	highlight CopilotSuggestion guifg=#2e5d7d ctermfg=8
]]

require("keymaps")
require("plugins")
require("lsp-config")
