local M = {
	"TimUntersberger/neogit",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("neogit").setup({
			disable_commit_confirmation = true,
			disable_context_highlighting = true,
			integrations = {
				diffview = true,
			},
		})
	end,
	enabled = _G.enabled.neogit,
	keys = {
		{ "<leader>g", "<cmd>Neogit<cr>", desc = "Neogit open" },
	},
}

return M
