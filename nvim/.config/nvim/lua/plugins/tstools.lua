local options = {
	settings = {
		maxPreload = 10000,
		preloadFileSize = 1000,
		allow_incremental_sync = true,
		root_dir = require("lspconfig.util").root_pattern(".git"),
		separate_diagnostic_server = false,
		publish_diagnostic_on = "insert_leave",
		vtsls = {
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
	},
}
return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	event = "VeryLazy",
	ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	setup = function()
		require("typescript-tools").setup(options)
	end,
}
