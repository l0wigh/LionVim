
local function clear()
	vim.api.nvim_buf_clear_namespace(0, 0, 0, -1)
end

local function line()
	local x = vim.api.nvim_get_current_line()
	local calc = assert(load("return " .. x))
	local y = calc()
	local opts = {}
	local currline = vim.api.nvim_win_get_cursor(0)
	vim.api.nvim_buf_clear_namespace(0, 0, currline[1] - 1, currline[1])
	vim.api.nvim_buf_set_virtual_text(0, 0, currline[1] - 1, {{ " = " .. y .. " 🦁", "Error" }}, opts)
end

local function full()
	if pcall(clear) then
		print()
	end
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	for i,v in ipairs(lines) do
		local calc = assert(load("return " .. v))
		if pcall(calc) then
			local y = calc()
			if y ~= nil then
				local opts = {}
				vim.api.nvim_buf_set_virtual_text(0, 0, i - 1, {{ " = " .. y .. " 🦁", "Error" }}, opts)
			end
		end
	end
end

return {
	line = line,
	full = full,
	clear = clear,
}
