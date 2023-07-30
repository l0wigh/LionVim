require("which-key").setup{}
local wk = require("which-key")

wk.register({
	["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
	["u"] = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", "Undotree" },
	["T"] = { "<cmd>call LionTerminal()<CR>", "Open Terminal" },
	d = {
		name = "+DAP",
		c = { "<cmd>call LionAddDapConfig()<CR>", "Add DAP Config" },
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		R = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Run to Cursor" },
		r = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
		n = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
		N = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
		s = { "<cmd>lua require'dapui'.setup()<CR>", "Setup DAP UI" },
		t = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle DAP UI" },
		k = { "<cmd>lua require'dap'.terminate()<CR>", "Kill Process" },
	},
	h = {
		name = "+Hop",
		f = { "<cmd>lua require('hop').hint_char1()<CR>", "Hop to a char" },
		w = { "<cmd>HopWord<CR>", "Hop to a word" },
		l = { "<cmd>HopLine<CR>", "Hop to a line" },
		p = { "<cmd>HopPattern<CR>", "Hop to a pattern" },
	},
	L = {
		name = "+LionVim",
		u = {"<cmd>call LionUpdate()<CR>", "Update the Lion"},
		s = {"<cmd>call LionStatus()<CR>", "Lion Status"},
		p = {
			name = "+Project Manager",
			m = { "<cmd>call LionProjectsManager()<CR>", "Main Menu" },
			n = { "<cmd>call LionNewProject()<CR>", "Add a Project" },
			o = { "<cmd>call LionOpenProject()<CR>", "Open a Project" },
			d = { "<cmd>call LionDelProject()<CR>", "Delete a Project" },
		}
	},
	q = {
		name = "+Quick Menu",
		n = {"<cmd>call LionNewFile()<CR>", "Create a new file"},
	},
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
		b = {"<cmd>Telescope buffers show_all_buffers=true<CR>", "Buffer Selector"}
	},
	l = {
		name = "+LSP",
		D = {":Lspsaga goto_definition<CR>", "Show definition"},
		d = {":Lspsaga show_line_diagnostics<CR>", "Show diagnostic for the line"},
		s = {":Telescope lsp_document_symbols<CR>", "Show document symbols"},
		S = {":Telescope lsp_workspace_symbols<CR>", "Show workspace symbols"},
		R = {":lua vim.lsp.buf.references()<CR>", "Show references"},
		r = {":Lspsaga rename<CR>", "Show rename"},
		h = {":Lspsaga hover_doc<CR>", "Show hover doc"},
		c = {":Lspsaga code_action<CR>", "Show code action"},
		n = {":Lspsaga diagnostic_jump_next<CR>", "Show next diagnostic"},
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
			l = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
			m = {"<cmd>Telescope marks<cr>", "Show Marks"},
		},
		p = {
			name = "+Packer",
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
			c = { "<cmd>PackerCompile<cr>", "Compile" },
		},
		c = {
			name = "+Calc.nvim",
			f = {"<cmd>call CalcFull()<CR>", "Calculate in the file"},
			l = {"<cmd>call CalcLine()<CR>", "Calculate the current line"},
			c = {"<cmd>lua require('calc').clear()<CR>", "Clear everything"},
		},
		u = { "<cmd>call LionPackagesUpdate()<CR>", "Update plugins" }
	}
},
	{ prefix = "<leader>", mode = "n", noremap = true }
)

wk.register({
	["/"] = { "<cmd>norm gc<CR>", "Comment" },
},
	{ prefix = "<leader>", mode = "v", noremap = true }
)
