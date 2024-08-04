local M = {
	"folke/which-key.nvim",
	enabled = _G.enabled.which_key,
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			t = {
				name = "Tree & test",
			},
		}, { prefix = "<leader>" })
	end,
}

return M
