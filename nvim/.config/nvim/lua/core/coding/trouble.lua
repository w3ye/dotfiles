local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>xx",
			"<cmd>TroubleToggle<cr>",
			desc = "Trouble Toggle",
			{ silent = true, noremap = true },
		},
		{
			"<leader>xw",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			desc = "Trouble Toggle Workspace",
			{ silent = true, noremap = true },
		},
		{
			"<leader>xd",
			"<cmd>TroubleToggle document_diagnostics<cr>",
			desc = "Trouble Toggle document diagnostics",
			{ silent = true, noremap = true },
		},
		{
			"<leader>xl",
			"<cmd>TroubleToggle loclist<cr>",
			desc = "Trouble Toggle loclist",
			{ silent = true, noremap = true },
		},
		{
			"<leader>xq",
			"<cmd>TroubleToggle quickfix<cr>",
			desc = "Trouble qf",
			{ silent = true, noremap = true },
		},
		{
			"gR",
			"<cmd>TroubleToggle lsp_references<cr>",
			desc = "Trouble lsp_ref",
			{ silent = true, noremap = true },
		},
	},
}

return M
