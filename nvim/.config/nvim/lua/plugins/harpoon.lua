return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local harpoon = require("harpoon")
		return {
			{
				"<leader>a",
				function()
					harpoon:list():add()
				end,
				desc = "harpoon add",
			},
			{
				"<C-e>",
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "harpoon toggle",
			},
		}
	end,
}
