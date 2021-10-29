local notification = require("notify")
local popup = require("popup")

notification.setup({
	background_colour = "#000000"
})

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
		"    LionVim - Version: 0.0.2",
		"    Codename: Ready to Roar",
		"",
		"    I think I might deserve some rest",
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


return {
	update = update,
	status = status,
}
