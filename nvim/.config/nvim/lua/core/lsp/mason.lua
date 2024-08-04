local M = {
	"williamboman/mason.nvim",
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"rust_analyzer",
					"tsserver",
					"eslint",
					"lua_ls",
					"gopls",
				},
			})
		end,
		dependencies = { "williamboman/mason.nvim" },
	},
}

return M
