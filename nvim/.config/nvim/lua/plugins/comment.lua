return {
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true, event = "VeryLazy" },
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
