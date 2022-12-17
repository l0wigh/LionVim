require("nvim-tree").setup{
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "╰",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		}
	}
}
