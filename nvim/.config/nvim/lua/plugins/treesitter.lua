return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	opts = {
		ensure_installed = { "lua", "javascript", "typescript" },
		highlight = { enable = true },
		indent = { enable = true },
	},
}
