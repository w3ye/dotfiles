local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.black },
	},
	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },
	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
		options = {
			-- theme = bubbles_theme,
			component_separators = "|",
			-- section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "NvimTree", "packer", "dap" },
				winbar = { "NvimTree", "packer", "dap" },
			},
		},
		sections = {
			lualine_a = {
				{
					"mode", --[[ separator = { left = "" }, ]]
					right_padding = 2,
				},
			},
			lualine_b = { { "filename", path = 1, symbols = { modified = " ●" } }, "branch" },
			lualine_c = { "diagnostics", "fileformat" },
			lualine_x = {},
			lualine_y = { "filetype", "progress" },
			lualine_z = {
				{
					"location", --[[ separator = { right = "" }, ]]
					left_padding = 2,
				},
			},
		},
		inactive_sections = {
			lualine_a = { { "filename", path = 1, symbols = { modified = " ●" } } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {},
	},
}
