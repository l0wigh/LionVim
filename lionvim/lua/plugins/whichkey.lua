require("which-key").setup{}
local wk = require("which-key")

wk.register({
	["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
	["u"] = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", "Undotree" },
	L = {
		name = "+LionVim",
		u = {"<cmd>call LionUpdate()<CR>", "Update the Lion"},
		s = {"<cmd>call LionStatus()<CR>", "Lion Status"},
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
		c = {
			name = "+Calc.nvim",
			f = {"<cmd>call CalcFull()<CR>", "Calculate in the file"},
			l = {"<cmd>call CalcLine()<CR>", "Calculate the current line"},
			c = {"<cmd>lua require('calc').clear()<CR>", "Clear everything"},
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
