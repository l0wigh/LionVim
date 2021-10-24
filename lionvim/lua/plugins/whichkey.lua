require("which-key").setup{}
local wk = require("which-key")

wk.register({
	["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
	["u"] = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", "Undotree" },
	w = {
		name = "+Windows",
		h = {"<cmd>split<CR>", "Horizontal Split"},
		v = {"<cmd>vsplit<CR>", "Veritcal Split"},
		c = {"<cmd>:q<CR>", "Close Current Split"},
		x = {"<C-w>x", "Swap Windows"},
		t = {"<cmd>call ToggleWindows()<CR>", "Switch Split Type"},
	},
	b = {
		name = "+Buffer",
		p = {"<cmd>BufferPin<CR>", "Pin Buffer"},
		e = {"<cmd>BufferCloseAllButCurrent<CR>", "Close All But Current"},
		a = {"<cmd>BufferCloseAllButPinned<CR>", "Close All But Pinned"},
		c = {"<cmd>BufferClose!<CR>", "Close Buffer"},
	},
	l = {
		name = "+LSP",
		D = {":lua vim.lsp.buf.definition()<CR>", "Show definition"},
		d = {":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show diagnostic for the line"},
		i = {":lua vim.lsp.buf.implementation()<CR>", "Show implementation"},
		s = {":lua vim.lsp.buf.signature_help()<CR>", "Show signature help"},
		R = {":lua vim.lsp.buf.references()<CR>", "Show references"},
		r = {":lua vim.lsp.buf.rename()<CR>", "Show rename"},
		h = {":lua vim.lsp.buf.hover()<CR>", "Show hover"},
		c = {":lua vim.lsp.buf.code_action()<CR>", "Show code action"},
		n = {":lua vim.lsp.diagnostic.goto_next()<CR>", "Show next diagnostic"},
	},
	-- Vim tabs stuff mappings
	t = {
		name = "+Tabs",
		n = {"<cmd>tabnew<CR>", "New Tab"},
		c = {"<cmd>tabclose<CR>", "Close Current Tab"},
		m = {"<cmd>tabnext<CR>", "Next Tab"},
		j = {"<cmd>tabprevious<CR>", "Previous Tab"},
	},
	p = {
		name = "Plugin",
		t = {
			name = "Telescope",
			f = {"<cmd>Telescope find_files<cr>", "Find files" },
			h = {"<cmd>Telescope help_tags<cr>", "Help pages" },
			c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
			b = {"<cmd>Telescope buffers show_all_buffers=true<cr>", "Show Buffers"},
		},
		p = {
			name = "+Packer",
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
			c = { "<cmd>PackerCompile<cr>", "Compile" },
		},
	}
},
	{ prefix = "<leader>", mode = "n", noremap = true }
)

wk.register({
	["/"] = { "<cmd>norm gc<CR>", "Comment" },
},
	{ prefix = "<leader>", mode = "v", noremap = true }
)

--[[
		["/"] = { "<cmd>CommentToggle<CR>", "Comment" }
	["u"] = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", "Undotree" },
	-- SolarVim Tools
	S = {
		name = "+SolarVim",
		u = {'<cmd>call SolarUpdate()<CR>', "Update SolarVim"},
	},
	-- Vim windows stuff mappings
	w = {
		name = "+Windows",
		h = {"<cmd>split<CR>", "Horizontal Split"},
		v = {"<cmd>vsplit<CR>", "Veritcal Split"},
		c = {"<cmd>:q<CR>", "Close Current Split"},
		x = {"<C-w>x", "Swap Windows"},
		t = {"<cmd>call ToggleWindows()<CR>", "Switch Split Type"},
	},
	-- Custom shortcuts
	s = {
		name = "+Shortcuts",
		w = {'"0yw/<C-r>0<CR>', "Search the current word"},
	},
	-- Native LSP functions mappings
	l = {
		name = "+LSP",
		D = {":lua vim.lsp.buf.definition()<CR>", "Show definition"},
		d = {":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show diagnostic for the line"},
		i = {":lua vim.lsp.buf.implementation()<CR>", "Show implementation"},
		s = {":lua vim.lsp.buf.signature_help()<CR>", "Show signature help"},
		R = {":lua vim.lsp.buf.references()<CR>", "Show references"},
		r = {":lua vim.lsp.buf.rename()<CR>", "Show rename"},
		h = {":lua vim.lsp.buf.hover()<CR>", "Show hover"},
		c = {":lua vim.lsp.buf.code_action()<CR>", "Show code action"},
		n = {":lua vim.lsp.diagnostic.goto_next()<CR>", "Show next diagnostic"},
	},
	-- Vim tabs stuff mappings
	t = {
		name = "+Tabs",
		n = {"<cmd>tabnew<CR>", "New Tab"},
		c = {"<cmd>tabclose<CR>", "Close Current Tab"},
		m = {"<cmd>tabnext<CR>", "Next Tab"},
		j = {"<cmd>tabprevious<CR>", "Previous Tab"},
	},
	-- Vim buffers stuff mappings
	b = {
		name = "+Buffer",
		p = {"<cmd>BufferPin<CR>", "Pin Buffer"},
		e = {"<cmd>BufferCloseAllButCurrent<CR>", "Close All But Current"},
		a = {"<cmd>BufferCloseAllButPinned<CR>", "Close All But Pinned"},
		c = {"<cmd>BufferClose!<CR>", "Close Buffer"},
	},
	-- Plugins mappings
	p = {
		name = "+Plugins",
		-- VimWiki
		w = {
			name = "+VimWiki",
			w = {"<cmd>VimwikiIndex<CR>", "Show your index wiki file"},
			d = {"<cmd>VimwikiDiaryIndex<CR>", "Show your diary index file"},
			D = {"<cmd>VimwikiMakeDiaryNote<CR>", "Open your diary for the current day"},
			b = {"<cmd>VimwikiGoBackLink<CR>", "Go back to the wiki page you came from"},
			x = {"<cmd>VimwikiDeleteFile<CR>", "Delete the current wiki file"},
			r = {"<cmd>VimwikiRenameFile<CR>", "Rename the current wiki file"},
			t = {"<cmd>VimwikiNextTask<CR>", "Go to the next unfinished task"},
			T = {":VimwikiTable  ", "Create a new table"},
			c = {"<cmd>VimwikiToggleListItem<CR>", "Check/Uncheck the current list item"},
			C = {"<cmd>VimwikiColorize<CR><cmd>s/background/color/g<CR>", "Add yellow color to the current line"},
			s = {"<cmd>VimwikiChangeSymbolTo -<CR>", "Create a list item on the current line"},
			n = {"<cmd>VimwikiListToggle<CR>", "Create a task on the current line"},
		},
		-- Telescope
		t = {
			name = "+Telescope" ,
			f = {"<cmd>Telescope find_files<cr>", "Find files" },
			h = {"<cmd>Telescope help_tags<cr>", "Help pages" },
			c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
			b = {"<cmd>Telescope buffers show_all_buffers=true<cr>", "Show Buffers"},
		},
		-- Packer
		p = {
			name = "+Packer",
			i = { "<cmd>PackerInstall<cr>", "Install" },
			r = { "<cmd>lua require('lv-utils').reload_lv_config()<cr>", "Reload" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},
		-- Bracey
		b = {
			name = "+Bracey",
			s = { "<cmd>Bracey<cr>", "Start Server" },
			k = { "<cmd>BraceyStop<cr>", "Kill Server" },
			r = { "<cmd>BraceyReload<cr>", "Reload Server" },
			e = { "<cmd>BraceyEval<cr>", "Eval Current Buffer" },
		},
		-- Symbols Outline
		o = {"<cmd>SymbolsOutline<CR>", "Show/Hide Symbols"},
		z = {"<cmd>ZenMode<CR>", "Start ZenMode"},
	}
}
--]]
