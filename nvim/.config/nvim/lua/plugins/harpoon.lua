return {
	"ThePrimeagen/harpoon",
	lazy = true,
	event = "VeryLazy",
	keys = {
		{ "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "harpoon mark" },
		{ "<leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "harpoon toggle" },
	},
}
