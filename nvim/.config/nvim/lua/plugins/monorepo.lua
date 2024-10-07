return {
	"imNel/monorepo.nvim",
	config = function()
		require("monorepo").setup({})
	end,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>m",
			function()
				require("telescope").extensions.monorepo.monorepo()
			end,
			desc = "Toggle list",
		},
		{
			"<leader>ma",
			function()
				require("monorepo").toggle_project()
			end,
			desc = "Toggle Monorepo",
		},
	},
}
