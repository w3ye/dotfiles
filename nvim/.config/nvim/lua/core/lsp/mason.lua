local M = {
	"williamboman/mason.nvim",
	enabled = _G.enabled.mason,
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
		end,
		dependencies = { "williamboman/mason.nvim" },
	},
}

return M
