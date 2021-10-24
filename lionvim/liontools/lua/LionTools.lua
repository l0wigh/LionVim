local notification = require("notify")

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
	notification("Version 0.0.1", "Information", { title = "LionVim" })
	notification("Codename: Panic Attack", "Information", { title = "LionVim" })
end


return {
	update = update,
	status = status,
}
