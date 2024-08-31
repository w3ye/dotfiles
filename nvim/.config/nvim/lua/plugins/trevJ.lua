return {
	"AckslD/nvim-trevJ.lua",
	lazy = true,
	event = "VeryLazy",
	keys = {
		{
			"<leader>J",
			"<cmd>lua require('trevj').format_at_cursor()<cr>",
		},
	},
}
