local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
	function (server_name)
		local lsp_options = { capabilities = capabilities }
        require("lspconfig")[server_name].setup(lsp_options)
    end,
}

require("mason-nvim-dap").setup({
    automatic_setup = true,
	automatic_installation = true,
})
