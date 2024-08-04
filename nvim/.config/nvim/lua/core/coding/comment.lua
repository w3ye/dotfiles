local M = {
	"numToStr/Comment.nvim",
	enabled = _G.enabled.comment,
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}

return M
