return {
	"imNel/monorepo.nvim",
	config = function()
		require("monorepo").setup({
			silent = false, -- Supresses vim.notify messages
			autoload_telescope = true, -- Automatically loads the telescope extension at setup
			data_path = vim.fn.stdpath("data"), -- Path that monorepo.json gets saved to
		})
	end,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>m",
			function()
				require("telescope").extensions.monorepo.monorepo()
			end,
			desc = "monorepo",
		},
		{
			"<leader>ma",
			function()
				require("monorepo").add_project()
			end,
			desc = "monorepo add project",
		},
		{
			"<leader>mr",
			function()
				require("monorepo").remove_project()
			end,
			desc = "monorepo remove project",
		},
		{
			"<leader>n",
			function()
				require("monorepo").toggle_project()
			end,
			desc = "monorepo toggle project",
		},
	},
}
