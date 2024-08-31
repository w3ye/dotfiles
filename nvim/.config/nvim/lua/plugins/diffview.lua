return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>dv",
			"<cmd>DiffviewOpen<cr>",
			desc = "Open diff",
		},
		{
			"<leader>dc",
			"<cmd>DiffviewClose<cr>",
			desc = "Close diff",
		},
		{
			"<leader>dh",
			"<cmd>DiffviewFileHistory %<cr>",
			desc = "diff history",
		},
	},
	opts = {},
}
