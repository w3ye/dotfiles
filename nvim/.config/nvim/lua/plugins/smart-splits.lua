return {
	"mrjones2014/smart-splits.nvim",
	opts = {
		ignored_buftypes = {
			"nofile",
			"quickfix",
			"prompt",
		},
	},
	keys = {
		{
			"<leader>mh",
			function()
				require("smart-splits").swap_buf_left()
			end,
			desc = "Swap Buffer Left",
		},
		{
			"<leader>mj",
			function()
				require("smart-splits").swap_buf_down()
			end,
			desc = "Swap Buffer Down",
		},
		{
			"<leader>mk",
			function()
				require("smart-splits").swap_buf_up()
			end,
			desc = "Swap Buffer Up",
		},
		{
			"<leader>ml",
			function()
				require("smart-splits").swap_buf_right()
			end,
			desc = "Swap Buffer Right",
		},
		{
			"<C-h>",
			function()
				require("smart-splits").move_cursor_left()
			end,
		},
		{
			"<C-j>",
			function()
				require("smart-splits").move_cursor_down()
			end,
		},
		{
			"<C-k>",
			function()
				require("smart-splits").move_cursor_up()
			end,
		},
		{
			"<C-l>",
			function()
				require("smart-splits").move_cursor_right()
			end,
		},
	},
}
