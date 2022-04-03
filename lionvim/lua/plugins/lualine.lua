local function lionline()
	return [[LionVim]]
end

if (vim.g.nvui == nil) then
require("lualine").setup{
	options = {
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' }
	},
	sections = {
		lualine_a = { lionline },
		lualine_b = {},
		lualine_c = {'diagnostics'},
		lualine_x = {'diff', 'branch'},
		lualine_y = {'filename'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
}
else
require("lualine").setup{
	options = {
		section_separators = { left = ' ', right = ' ' },
		component_separators = { left = '', right = '' }
	},
	sections = {
		lualine_a = { lionline },
		lualine_b = {},
		lualine_c = {'diagnostics'},
		lualine_x = {'diff', 'branch'},
		lualine_y = {'filename'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
}
end
