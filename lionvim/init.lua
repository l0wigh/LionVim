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

	nnoremap j h
	nnoremap k j
	nnoremap l k
	nnoremap m l
	nnoremap h m
	nnoremap ù 0

	vnoremap j h
	vnoremap k j
	vnoremap l k
	vnoremap m l
	vnoremap h m
	vnoremap ù 0

	nnoremap <C-w>j <C-w>h
	nnoremap <C-w>k <C-w>j
	nnoremap <C-w>l <C-w>k
	nnoremap <C-w>m <C-w>l
	nnoremap <C-w>h <C-w>m

	tnoremap jk <C-\><C-n>

	inoremap jk <Esc>

	let mapleader = " "

	if exists("g:neovide")
		set guifont=JetBrains\ Mono:h16
		"set guifont=VictorMono\ NF:h16
		" set guifont=Cozette:h14
		nmap <C-shift-c> "+y
		vmap <C-shift-c> "+y
		nmap <C-shift-v> "+p
	else
		" autocmd VimEnter * hi Normal guibg=none
		" autocmd VimEnter * hi LineNr guibg=none
		" autocmd VimEnter * hi SignColumn guibg=none
		" autocmd VimEnter * hi NormalNC guibg=none
		" autocmd VimEnter * hi MsgArea guibg=none
		" autocmd VimEnter * hi TelescopeBorder guibg=none
		" autocmd VimEnter * hi NvimTreeNormal guibg=none
		" autocmd VimEnter * hi LspSagaFinderSelection guibg=none
		" autocmd VimEnter * hi LspFloatWinNormal guibg=none
		" autocmd VimEnter * hi DiagnosticError guibg=none
		" autocmd VimEnter * hi DiagnosticWarning guibg=none
		" autocmd VimEnter * hi DiagnosticInformation guibg=none
		" autocmd VimEnter * hi DiagnosticHint guibg=none
	endif
	"set background=light
	"colorscheme prism
	"colorscheme pywal
	let g:enfocado_style = 'neon'
	colorscheme vanessa
	highlight CopilotSuggestion guifg=#2e5d7d ctermfg=8
]]

require("plugins")
require("completion")
require("lsp-config")
