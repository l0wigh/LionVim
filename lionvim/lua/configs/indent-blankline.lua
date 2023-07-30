require("indent_blankline").setup {
	indentLine_enabled = 1,
	filetype_exclude = {
		"help",
		"terminal",
		"dashboard",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"mason",
		"",
	},
	buftype_exclude = { "terminal" },
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	show_current_context = true,
	show_current_context_start = true,

}

vim.cmd [[
	highlight! link IndentBlanklineContextChar Function
	autocmd! CursorMoved,CursorMovedI * highlight! IndentBlanklineContextStart guibg=NONE guifg=NONE guisp=#3c3836 gui=NONE
]]

vim.cmd[[
	let g:indent_blankline_char = '∙'
]]

vim.cmd[[
	let g:indent_blankline_context_char = '∙'
]]
