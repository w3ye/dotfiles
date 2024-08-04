local M = {
	"windwp/nvim-autopairs",
	enabled = _G.enabled.autopairs,
	config = function(_, opts)
		require("nvim-autopairs").setup(opts)
	end,
	opts = {
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = [=[[%'%"%)%>%]%)%}%,]]=],
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			highlight = "Search",
			highlight_grey = "Comment",
		},
	},
}

return M
