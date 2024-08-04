local M = {
	{
		"supermaven-inc/supermaven-nvim",
        enabled = _G.enabled.supermaven,
		config = function(_, opts)
			require("supermaven-nvim").setup(opts)
		end,
		opts = {
			keymaps = {
				accept_suggestion = "<M-l>",
				clear_suggestion = "<C-]>",
				accept_word = "<M-k>",
			},
			color = {
				-- suggestion_color = "#ffffff",
				cterm = 244,
			},
			log_level = "info", -- set to "off" to disable logging completely
			disable_inline_completion = false, -- disables inline completion for use with cmp
			disable_keymaps = false, -- disables built in keymaps for more manual control
		},
	},
}

return M
