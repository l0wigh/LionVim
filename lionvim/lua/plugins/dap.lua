local dap = require("dap")
dap.configurations.c = {
	{
		type = 'codelldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
		end,
		cwd = '${workspaceFolder}',
		terminal = 'integrated',
		args = function ()
			local a = {}
			a[1] = vim.fn.input('Arguments : ')
			return a
		end
	}
}
