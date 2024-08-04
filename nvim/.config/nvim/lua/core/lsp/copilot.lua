local enabled = _G.enabled.cmp
local M = {
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	enabled = enabled,
	-- 	config = function()
	-- 		require("copilot_cmp").setup({
	-- 			formatters = {},
	-- 		})
	-- 	end,
	-- 	event = { "InsertEnter", "LspAttach" },
	-- 	fix_pairs = true,
	-- },
	{
		"zbirenbaum/copilot.lua",
		dependencies = { "zbirenbaum/copilot-cmp" },
		enabled = false,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-p>",
					},
					layout = {
						position = "right", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				-- copilot_node_command = "node", -- Node.js version must be > 16.x
				server_opts_overrides = {},
			})
		end,
		keys = {
			{ "<leader>cp", "<cmd>Copilot panel<cr>", desc = "Open copilot panel", mode = "n" },
		},
	},
}

return M
