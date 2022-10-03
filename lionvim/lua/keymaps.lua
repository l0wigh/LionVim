-- Keymaps

-- Moving hjkl to jklm for better experience on azerty keyboards
vim.cmd [[
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
]]

-- Some more keybinds
vim.cmd [[
	tnoremap jk <C-\><C-n>
	inoremap jk <Esc>
	let mapleader = " "
]]
