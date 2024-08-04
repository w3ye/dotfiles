local M = {
	"kdheepak/lazygit.nvim",
	lazy = false,
	enabled = _G.enabled.lazygit,
	keys = {
		{
			"<leader>lg",
			"<cmd>LazyGit<cr>",
			desc = "LazyGit Open",
		},
	},
}

return M
