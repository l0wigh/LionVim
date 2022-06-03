local notification = require("notify")
local popup = require("popup")

notification.setup({
	background_colour = "#000000"
})

local function deleteproject(mode)

	local Menu = require("nui.menu")
	local event = require("nui.utils.autocmd").event
	local list_name = {}
	local counter = 1
	local list_folder = {}

	for line in io.lines("/home/thomas/.config/lionvim/projects-names.lion") do
		list_name[#list_name + 1] = Menu.item(line, { id = counter })
		counter = counter + 1
	end

	for line in io.lines("/home/thomas/.config/lionvim/projects-folders.lion") do
		list_folder[#list_folder + 1] = line
		counter = counter + 1
	end

	print(list_name[1])

	local menu = Menu({
		position = "50%",
		relative = "editor",
		size = {
			width = 50,
			height = 5,
		},
		border = {
			style = "rounded",
			text = {
				top = "[Select a project]",
				top_align = "center",
			},
		},
		win_options = {
			winblend = 10,
			winhighlight = "Normal:Normal",
		},
	}, {
		lines = list_name,
		max_width = 20,
		keymap = {
			focus_next = { "k", "<Down>", "<Tab>" },
			focus_prev = { "l", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			print("No projects selected")
		end,
		on_submit = function(item)
			os.execute('sed -i "' .. item.id .. 'd" /home/thomas/.config/lionvim/projects-names.lion &> /dev/null')
			os.execute('sed -i "' .. item.id .. 'd" /home/thomas/.config/lionvim/projects-folders.lion &> /dev/null')
			if (mode == 1) then
				deleteproject(1)
			end
		end,
	})

	menu:mount()

	menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
end


local function selectproject(mode)

	local Menu = require("nui.menu")
	local event = require("nui.utils.autocmd").event
	local list_name = {}
	local counter = 1
	local list_folder = {}

	for line in io.lines("/home/thomas/.config/lionvim/projects-names.lion") do
		list_name[#list_name + 1] = Menu.item(line, { id = counter })
		counter = counter + 1
	end

	for line in io.lines("/home/thomas/.config/lionvim/projects-folders.lion") do
		list_folder[#list_folder + 1] = line
		counter = counter + 1
	end

	local menu = Menu({
		position = "50%",
		relative = "editor",
		size = {
			width = 50,
			height = 5,
		},
		border = {
			style = "rounded",
			text = {
				top = "[Select a project]",
				top_align = "center",
			},
		},
		win_options = {
			winblend = 10,
			winhighlight = "Normal:Normal",
		},
	}, {
		lines = list_name,
		max_width = 20,
		keymap = {
			focus_next = { "k", "<Down>", "<Tab>" },
			focus_prev = { "l", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			print("No projects selected")
		end,
		on_submit = function(item)
			print("Open Project :", list_name[item.id])
			vim.cmd("e " .. list_folder[item.id])
		end,
	})

	-- mount the component
	menu:mount()

	-- close menu when cursor leaves buffer
	menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
end

local function newprojects_folder(name, mode)
	local Input = require("nui.input")

	local popup_options = {
		relative = "editor",
		position = "50%";
		size = 40,
		border = {
			style = "rounded",
			highlight = "FloatBorder",
			text = {
				top = "[Project Folder]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal",
		},
	}

	local input = Input(popup_options, {
		prompt = "> ",
		default_value = "",
		on_close = function()
			print("No project created")
			if (mode == 1) then
				Projectsmanager()
			end
		end,
		on_submit = function(value)
			os.execute("echo \"" .. value .. "\" >> ~/.config/lionvim/projects-folders.lion")
			os.execute("echo \"" .. name .. "\" >> ~/.config/lionvim/projects-names.lion")
			print("Project" .. value .. " created")
		end,
	})

	input:mount()
	input:map("n", "<Esc>", input.input_props.on_close, { noremap = true })
end

local function newprojects_name(mode)
	local Input = require("nui.input")

	local popup_options = {
		relative = "editor",
		position = "50%";
		size = 40,
		border = {
			style = "rounded",
			highlight = "FloatBorder",
			text = {
				top = "[Project Name]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal",
		},
	}

	local input = Input(popup_options, {
		prompt = "> ",
		default_value = "",
		on_close = function()
			print("No file created")
			if (mode == 1) then
				Projectsmanager()
			end
		end,
		on_submit = function(value)
			newprojects_folder(value, mode)
		end,
	})

	input:mount()
	input:map("n", "<Esc>", input.input_props.on_close, { noremap = true })
end

local function newFile()
	local Input = require("nui.input")
	local event = require("nui.utils.autocmd").event

	local popup_options = {
		relative = "editor",
		position = "50%";
		size = 40,
		border = {
			style = "rounded",
			highlight = "FloatBorder",
			text = {
				top = "[Filename]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal",
		},
	}

	local input = Input(popup_options, {
		prompt = "> ",
		default_value = "",
		on_close = function()
			print("No file created")
		end,
		on_submit = function(value)
			print("New file: ", value)
			vim.cmd("edit " .. value)
		end,
	})
	input:mount()
	input:map("n", "<Esc>", input.input_props.on_close, { noremap = true })
end

local function update()
	os.execute("mv $HOME/.config/lionvim ~/.config/_old_lion")
	os.execute("cd $HOME/.config/ && git clone https://github.com/l0wigh/LionVim temp && cp -r temp/lionvim .")
	os.execute("rm -rf $HOME/.config/temp")
	vim.cmd("e $HOME/.config/lionvim/init.lua")
	vim.cmd("so %")
	vim.cmd [[
		hi Normal guibg=none
		hi LineNr guibg=none
		hi SignColumn guibg=none
		hi NormalNC guibg=none
		hi MsgArea guibg=none
		hi TelescopeBorder guibg=none
		hi NvimTreeNormal guibg=none
	]]
	vim.cmd("BufferClose")
	vim.cmd("e $HOME/.config/lionvim/lua/plugins.lua")
	vim.cmd("so %")
	vim.cmd("PackerSync")
	vim.cmd("BufferClose")
	notification("Update finished, you might need to restart to see changes", "Information", { title = "LionVim" })
end

local function status()
	local content = {
		"    LionVim - Version: 0.0.5",
		"    Codename: Turbo 16",
		"",
		"    It's reliable ans working",
		"",
		"    Press 'q' to quit",
	}
	local width = 60
    local height = 10
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    local bufnr = vim.api.nvim_create_buf(false, false)
	popup.create(bufnr, {
        title = "LionVim Status",
        highlight = "Normal",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
	})
	vim.api.nvim_buf_set_lines(bufnr, 0, #content, false, content)
	vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "q",
        ":q!<CR>",
        { silent = true }
    )
end

function Projectsmanager()

	local Menu = require("nui.menu")
	local event = require("nui.utils.autocmd").event

	local menu = Menu({
		position = "50%",
		relative = "editor",
		size = {
			width = 50,
			height = 5,
		},
		border = {
			style = "rounded",
			text = {
				top = "[Lion Project Manager]",
				top_align = "center",
			},
		},
		win_options = {
			winblend = 10,
			winhighlight = "Normal:Normal",
		},
	}, {
		lines = {
			Menu.item("New Project", { id = 1 }),
			Menu.item("Open Project", { id = 2 }),
			Menu.item("Delete Project", { id = 3 }),
		},
		max_width = 20,
		keymap = {
			focus_next = { "k", "<Down>", "<Tab>" },
			focus_prev = { "l", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			print("Nothing to do")
		end,
		on_submit = function(item)
			if (item.id == 1) then
				newprojects_name(1)
			elseif (item.id == 2) then
				selectproject(1)
			else
				deleteproject(1)
			end
		end,
	})

	-- mount the component
	menu:mount()

	-- close menu when cursor leaves buffer
	menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
end

return {
	update = update,
	status = status,
	newFile = newFile,
	newprojects_name = newprojects_name,
	newprojects_folder = newprojects_folder,
	selectproject = selectproject,
	projectsmanager = Projectsmanager,
	deleteproject = deleteproject
}
