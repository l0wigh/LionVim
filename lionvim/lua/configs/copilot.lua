vim.cmd [[
	let b:copilot_enabled = v:true
	imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
	let g:copilot_no_tab_map = v:true
]]
