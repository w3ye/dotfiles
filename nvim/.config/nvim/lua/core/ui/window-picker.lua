local M = {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	version = "v2.*",
	config = function(_, opts)
		require("window-picker").setup(opts)
	end,
	opts = {
		hint = "floating-big-letter",
		prompt_message = "",
		filter_rules = {
			bo = { filetype = { "prompt" } },
		},
	},
	keys = {
		{
			"<leader>p",
			function()
				local window = require("window-picker").pick_window()
				if window ~= nil then
					vim.api.nvim_set_current_win(window)
				end
			end,
			desc = "pick window",
			{ silent = true },
		},
	},
}

return M
