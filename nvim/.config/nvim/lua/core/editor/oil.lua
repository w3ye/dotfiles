local M = {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup()
	end,
	keys = { { "-", mode = { "n" }, "<cmd>Oil<cr>", desc = "oil open" } },
}

return M
