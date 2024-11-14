return {
	"ThePrimeagen/harpoon",
	lazy = true,
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "harpoon mark",
		},
		{
			"<leader>ht",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "harpoon toggle",
		},
		{
			"<leader>n",
			function()
				require("harpoon"):list():next()
			end,
			desc = "harpoon next",
		},
		{
			"<leader>p",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "harpoon previous",
		},
	},
}
