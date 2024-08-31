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
	require("telescope").load_extension("bookmarks")
end

local telescope_keys = {
	{ "<C-f>", "<cmd>Telescope find_files<cr>" },
	{ "<leader>fA", "<cmd>Telescope live_grep<cr>" },
	{ "<leader>fa", "<cmd>Telescope live_grep_args<cr>" },
	{ "<leader>fs", "<cmd>Telescope grep_string<cr>" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>" },
	{ "<leader>f", "<cmd>Telescope<cr>" },
	{ "<leader>ff", "<cmd>Telescope buffers<cr>" },
	{ "<leader>fr", "<cmd>Telescope resume<cr>" },
	{
		"<leader>fm",
		"<cmd>lua require('telescope').extensions.bookmarks.list(require('telescope.themes').get_ivy())<cr>",
	},
	{ "<C-p>", "<cmd>Telescope projects<cr>" },
}

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VimEnter",
		config = telescope_setup,
		keys = telescope_keys,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{
		"tomasky/bookmarks.nvim",
		event = "VimEnter",
		opts = {
			sign_priority = 8, --set bookmark sign priority to cover other sign
			save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
			keywords = {
				["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
				["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
				["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
				["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
			},
			on_attach = function(bufnr)
				local bm = require("bookmarks")
				local map = vim.keymap.set
				map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
				map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
				map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
				map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
				map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
				map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
				map("n", "mx", bm.bookmark_clear_all) -- show marked file list in quickfix window
			end,
		},
		-- config = function()
		-- 	require("bookmarks").setup({
		-- 		sign_priority = 8, --set bookmark sign priority to cover other sign
		-- 		save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
		-- 		keywords = {
		-- 			["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
		-- 			["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
		-- 			["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
		-- 			["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
		-- 		},
		-- 		on_attach = function(bufnr)
		-- 			local bm = require("bookmarks")
		-- 			local map = vim.keymap.set
		-- 			map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
		-- 			map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
		-- 			map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
		-- 			map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
		-- 			map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
		-- 			map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
		-- 			map("n", "mx", bm.bookmark_clear_all) -- show marked file list in quickfix window
		-- 		end,
		-- 	})
		-- end,
	},
}
