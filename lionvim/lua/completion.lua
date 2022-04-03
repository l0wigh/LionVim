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
