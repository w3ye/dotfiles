local M = {
	"ThePrimeagen/harpoon",
	enabled = _G.enabled.harpoon,
	keys = {
		{ "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "harpoon mark" },
		{ "<leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "harpoon toggle" },
	},
}

return M
