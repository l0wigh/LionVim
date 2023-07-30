local fn = vim.fn
local plugs_path = fn.stdpath('data')..'/site/pack/packer/start/nvim-autopairs'
if fn.empty(fn.glob(plugs_path)) > 0 then
    vim.print("Lion is installing plugins...")
else 
    require("nvim-autopairs").setup{}
    require("configs.lualine")
    require("configs.42header")
    require("configs.treesitter")
    require("configs.lsp_signature")
    require("configs.nvim_cmp")
    require("configs.copilot")
    require("configs.nvimtree")
    require("configs.nvimcomment")
    require("configs.dashboard")
    require("configs.whichkey")
    require("configs.symbols")
    require("configs.indent-blankline")
    require("configs.mason")
    require("configs.null_ls")
    require("configs.dap")
end
