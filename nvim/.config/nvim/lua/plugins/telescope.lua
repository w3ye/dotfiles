local actions = require("telescope.actions")
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<M-d>"] = actions.delete_buffer,
					["<C-u>"] = false,
					["<C-p>"] = actions.results_scrolling_up,
					["<C-n>"] = actions.results_scrolling_down,
				},
				n = {
					["<C-d>"] = actions.delete_buffer,
					["<C-h>"] = actions.results_scrolling_up,
					["<C-l>"] = actions.results_scrolling_down,
				},
			},
		},
	},
	keys = {
		{
			"<C-f>",
			"<CMD>Telescope find_files<CR>",
			desc = "Find files(Telescope)",
		},
		{
			"<leader><leader>a",
			"<CMD>Telescope live_grep<CR>",
			desc = "Find files(Telescope)",
		},
		{
			"<leader><leader>",
			function()
				require("config.telescope.pickers.multi_grep").setup()
			end,
			desc = "Find files(Telescope)",
		},
		{ "<leader>f", "<cmd>Telescope<cr>" },
		{ "<leader>ff", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fr", "<cmd>Telescope resume<cr>" },
		{ "<leader>fs", "<cmd>Telescope grep_string<cr>" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", mode = { "n", "v" } },
	},
}
