local keys = {
	{ "gh", "<cmd>Lspsaga finder<CR>", desc = "lspsaga finder" },
	{
		"<leader>ca",
		"<cmd>Lspsaga code_action<CR>",
		desc = "Code Action",
		mode = { "n", "v" },
	},
	{
		"<leader>rn",
		"<cmd>Lspsaga rename<CR>",
		desc = "Rename variable",
	},
	{
		"<leader>RN",
		"<cmd>Lspsaga rename ++project<CR>",
		desc = "Project Wide Rename",
	},
	{
		"gp",
		"<cmd>Lspsaga peek_definition<CR>",
		desc = "Peek definition",
	},
	{
		"gd",
		"<cmd>Lspsaga goto_definition<CR>",
		desc = "Goto definition",
	},
	{
		"<leader>sl",
		"<cmd>Lspsaga show_line_diagnostics<CR>",
		desc = "show line diagnostics",
	},
	{
		"<leader>sb",
		"<cmd>Lspsaga show_buf_diagnostics<CR>",
		desc = "show buffer diagnostics",
	},
	{
		"<leader>sw",
		"<cmd>Lspsaga show_workspace_diagnostics<CR>",
		desc = "show workspace diagnostics",
	},
	{
		"<leader>sc",
		"<cmd>Lspsaga show_cursor_diagnostics<CR>",
		desc = "show cursor diagnostics",
	},
	{
		"[f",
		"<cmd>Lspsaga diagnostic_jump_prev<CR>",
		desc = "goto prev diagnostics",
	},
	{
		"]f",
		"<cmd>Lspsaga diagnostic_jump_next<CR>",
		desc = "goto next diagnostics",
	},
	{
		"[e",
		function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end,
		desc = "goto prev error",
	},
	{
		"]e",
		function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end,
		desc = "goto next error",
	},
	{
		"K",
		"<cmd>Lspsaga hover_doc<CR>",
		desc = "hover doc",
	},
	{
		"<leader>K",
		"<cmd>Lspsaga hover_doc ++keep<CR>",
		desc = "hover doc keep",
	},
	{
		"<Leader>ci",
		"<cmd>Lspsaga incoming_calls<CR>",
		desc = "lspsaga incoming calls",
	},
	{
		"<Leader>co",
		"<cmd>Lspsaga outgoing_calls<CR>",
		desc = "lspsaga outgoing calls",
	},
	{
		"<A-`>",
		"<cmd>Lspsaga term_toggle<CR>",
		desc = "toggle term",
		mode = { "n", "t" },
	},
}

local M = {
	"glepnir/lspsaga.nvim",
	enabled = _G.enabled.lspsaga,
	config = function()
		require("lspsaga").setup({
			request_timeout = 3000,
			breadcrumbs = {
				enable = false,
			},
			outline = {
				auto_preview = false,
				layout = "normal",
				detail = false,
				max_width = 0.7,
			},
			hover = {
				max_width = 0.6,
			},
			becon = {
				enable = true,
			},
			diagnostic = {
				max_height = 0.8,
				keys = {
					quit = { "q", "<ESC>" },
				},
			},
			preview = {
				lines_above = 0,
				lines_below = 10,
			},
			scroll_preview = {
				scroll_down = "<c-j>",
				scroll_up = "<c-k>",
			},
			lightbulb = {
				enable = false,
				enable_in_insert = false,
				virtual_text = false,
			},
		})
	end,
	event = "LspAttach",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		--Please make sure you install markdown and markdown_inline parser
		{ "nvim-treesitter/nvim-treesitter" },
	},
	keys = keys,
}

return M
