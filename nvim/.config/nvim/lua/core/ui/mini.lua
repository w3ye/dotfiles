vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
local M = {
	"echasnovski/mini.nvim",
	enabled = _G.enabled.mini,
	config = function()
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})
		vim.cmd("hi MiniIndentscopeSymbol guifg=#C678DD")
		require("mini.bufremove").setup({
			-- Whether to set Vim's settings for buffers (allow hidden buffers)
			set_vim_settings = true,

			-- Whether to disable showing non-error feedback
			silent = false,
		})
	end,
}

return M
