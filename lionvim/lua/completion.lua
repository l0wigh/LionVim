local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

lsp_installer.settings {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false })

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
			return npairs.esc('<c-y>')
		else
			return npairs.esc('<c-e>') .. npairs.autopairs_cr()
		end
	else
		return npairs.autopairs_cr()
	end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
		return npairs.esc('<c-e>') .. npairs.autopairs_bs()
	else
		return npairs.autopairs_bs()
	end
end

remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })

local lspkind = require('lspkind')

require "lsp_signature".setup({
	floating_window = false,
	floatin_window_above_cur_line = false,
	hint_enable = true,
	hint_prefix = "🦁 "
})

-- vim.cmd [[
-- 	" let b:copilot_enabled = v:false
-- 	" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- 	" let g:copilot_no_tab_map = v:true
-- ]]

vim.cmd [[
	let g:coq_settings = { 'display.pum.fast_close': v:false, 'auto_start': v:true , 'display.ghost_text.enabled': v:true }
]]

require("autopair")
