local M = {
	"junegunn/fzf",
	enabled = _G.enabled.fzf,
	build = function()
		vim.fn["fzf#install"]()
	end,
}

return M
