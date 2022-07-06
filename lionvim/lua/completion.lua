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

vim.cmd [[
	" let b:copilot_enabled = v:false
	" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
	" let g:copilot_no_tab_map = v:true
]]

local cmp = require("cmp")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text"
		}),
	},
	-- formatting = {
	-- 	fields = { "abbr", "kind", "menu" },
	-- 	format = function(entry, vim_item)
	-- 		local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
	-- 		local strings = vim.split(kind.kind, "%s", { trimempty = true })
	-- 		kind.kind = " " .. strings[1] .. " "
	-- 		kind.menu = " [" .. strings[2] .. "] "
	--
	-- 		return kind
	-- 	end,
	-- },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
	--     window = {
	-- 	completion = cmp.config.window.bordered(),
	-- 	documentation = cmp.config.window.bordered(),
	-- },
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Esc>"] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "cmdline" },
	}, {
		{ name = "buffer" },
	}),
	experimental = {
		ghost_text = true
	}
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

