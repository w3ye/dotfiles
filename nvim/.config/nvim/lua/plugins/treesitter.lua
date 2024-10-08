return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			ensure_installed = {
				"lua",
				"go",
				"javascript",
				"typescript",
				"css",
				"json",
				"yaml",
				"python",
				"fish",
				"bash",
				"markdown",
				"markdown_inline",
				"http",
			},
			auto_install = true,
			sync_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = false, -- set to `false` to disable one of the mappings
					node_incremental = "<c-a>",
					scope_incremental = "<c-c>",
					node_decremental = "<c-s>",
				},
			},
			rainbow = {
				enable = false,
			},
		})
	end,
}
