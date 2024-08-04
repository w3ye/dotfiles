local M = {
	"folke/which-key.nvim",
	enabled = _G.enabled.which_key,
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
}

return M
