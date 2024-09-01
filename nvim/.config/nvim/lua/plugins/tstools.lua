local options = {
	settings = {
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
	ft = { "typescript", "javascript" },
	setup = function()
		require("typescript-tools").setup(options)
	end,
}
