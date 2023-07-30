if (vim.g.nvui == nil) then
	local function lionline()
		return [[LionVim]]
	end
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
	function lionline()
		return [[LionVim UI]]
	end
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
