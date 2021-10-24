local notification = require("notify")

notification.setup({
	background_colour = "#000000"
})

local function update()
	os.execute("rm $HOME/.config/_old_lion")
	os.execute("mv $HOME/.config/lionvim ~/.config/_old_lion")
	os.execute("cd $HOME/.config/ && git clone https://github.com/l0wigh/LionVim temp && cp -r temp/lionvim . && rm temp")
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
	vim.cmd("PackerSync")
	vim.cmd("BufferClose")
	notification("Update finished, you might need to restart to see changes", "Information", { title = "LionVim" })
end

local function status()
	notification("This will show the status of LionVim", "Information", { title = "LionVim" })
end


return {
	update = update,
	status = status,
}
