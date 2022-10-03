local lspkind = require('lspkind')
local cmp = require("cmp")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

vim.cmd [[
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! link CmpItemAbbrMatch String
highlight! CmpItemAbbrMatch gui=NONE
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
]]

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
		}),
	},
    snippet = {
      expand = function(args)
		  require('luasnip').lsp_expand(args.body)
      end,
    },
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Esc>"] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "copilot" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "cmdline" },
	}, {
		{ name = "buffer" },
	}),
	experimental = {
		ghost_text = true
	}
})

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))


local luasnip = require('luasnip')
luasnip.config.set_config {
	history = true,
	updateevents = "TextChanged,TextChangedI"
}

require("luasnip/loaders/from_vscode").lazy_load()
