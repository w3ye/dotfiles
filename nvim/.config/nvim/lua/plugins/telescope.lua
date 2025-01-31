local telescope_setup = function()
	local actions = require("telescope.actions")
	local lga_actions = require("telescope-live-grep-args.actions")

	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--trim", -- add this value
			},
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
			file_ignore_patterns = {
				"node_modules",
			},
			path_display = { "truncate" },
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!.git/*" },
				file_ignore_patterns = { "node_modules", "dist", "vendor" },
			},
			oldfiles = {
				cwd_only = true,
			},
		},
		extensions = {
			live_grep_args = {
				auto_quoting = false,
				mappings = {
					i = {
						["<C-l>"] = lga_actions.quote_prompt(),
						["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
					},
				},
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})

	require("telescope").load_extension("fzf")
	require("telescope").load_extension("live_grep_args")
	-- require("telescope").load_extension("projects")
end

local telescope_keys = {
	{ "<C-f>", "<cmd>Telescope find_files<cr>" },
	{ "<leader><leader>a", "<cmd>Telescope live_grep<cr>" },
	{ "<leader><leader>", "<cmd>Telescope live_grep_args<cr>" },
	{ "<leader>fs", "<cmd>Telescope grep_string<cr>", mode = { "n", "v" } },
	{ "<leader><leader>o", "<cmd>Telescope oldfiles<cr>" },
	{ "<leader>f", "<cmd>Telescope<cr>" },
	{ "<leader>ff", "<cmd>Telescope buffers<cr>" },
	{ "<leader>fr", "<cmd>Telescope resume<cr>" },
	{
		"<leader>fm",
		"<cmd>lua require('telescope').extensions.bookmarks.list(require('telescope.themes').get_ivy())<cr>",
	},
	-- { "<C-p>", "<cmd>Telescope projects<cr>" },
}

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VimEnter",
		config = telescope_setup,
		keys = telescope_keys,
		tag = "0.1.8",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
}
