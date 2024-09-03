return {
	"ThePrimeagen/harpoon",
	lazy = true,
	event = "VeryLazy",
	keys = {
		{ "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "harpoon mark" },
		{ "<leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "harpoon toggle" },
		{ "<leader>hn", '<cmd>lua require("harpoon.ui").nav_next()<cr>', desc = "harpoon next" },
		{ "<leader>hh", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', desc = "harpoon previous" },
	},
}
