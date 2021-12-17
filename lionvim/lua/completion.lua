local lsp_installer = require("nvim-lsp-installer")
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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

local cmp = require'cmp'
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		})
	},
	sources = cmp.config.sources({
		{ name = 'cmp_tabnine'},
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'nvim_lua' },
		{ name = 'path'},
		{ name = 'buffer' },
	}),
	experimental = {
		ghost_text = false, -- to false when using github copilot
		native_menu = false
	},
})

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({with_text = true, maxwidth = 50, menu = {
		buffer =   "<BUF>",
		nvim_lsp = "<LSP>",
		nvim_lua = "<API>",
		path =     "<PATH>",
		luasnip =  "<SNIP>",
		cmp_tabnine =  "<TAB9>",
	}})
  }
}

require "lsp_signature".setup({
	floating_window = false,
	floatin_window_above_cur_line = false,
	hint_enable = true,
	hint_prefix = "🦁 "
})

require("luasnip/loaders/from_vscode").lazy_load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" } })                                                                                                                   

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())

vim.cmd [[
	imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
	let g:copilot_no_tab_map = v:true
]]
