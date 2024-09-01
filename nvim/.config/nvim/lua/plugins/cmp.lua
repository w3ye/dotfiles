return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind.nvim",
		},
		config = function()
			local c = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			local types = require("cmp.types")

			local borderstyle = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
			}

			c.setup({
				sources = c.config.sources({
					{ name = "supermaven" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "nvim_lua" },
					{
						name = "nvim_lsp",
						entry_filter = function(entry, _)
							return types.lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
						end,
					},
					{ name = "buffer", keyword_length = 3 },
					{ name = "path" },
				}),
				mapping = {
					["<C-b>"] = c.mapping.scroll_docs(-4),
					["<C-f>"] = c.mapping.scroll_docs(4),
					["<C-w>"] = c.mapping({ i = c.mapping.complete() }),
					["<C-j>"] = c.mapping.select_next_item(),
					["<C-k>"] = c.mapping.select_prev_item(),
					["<C-l>"] = c.mapping.select_next_item({ count = 4 }),
					["<C-h>"] = c.mapping.select_prev_item({ count = 4 }),
					["<C-r>"] = c.mapping({
						i = c.mapping.abort(),
						c = c.mapping.close(),
					}),
					["<Tab>"] = c.mapping.confirm({ select = false, behavior = c.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-e>"] = c.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-q>"] = c.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					expandable_indicator = true,
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						menu = {
							Supermaven = "",
							buffer = "",
							-- nvim_lsp = "[lsp]",
							-- nvim_lua = "[lua api]",
							luasnip = "",
						},
					}),
				},
				enabled = function()
					local context = require("cmp.config.context")
					if
						vim.api.nvim_get_mode().mode == "c"
						or vim.api.nvim_buf_get_option(0, "buftype") == ("prompt" or "nofile")
						or vim.bo.filetype == "gitcommit"
					then
						return false
					else
						return not context.in_treesitter_capture("comment") and not context.in_syntax_group("comment")
					end
				end,
				experimental = {
					-- ghost_text = true,
				},
				duplicates = {
					nvim_lsp = 1,
					luasnip = 1,
					buffer = 1,
					path = 1,
				},
				window = {
					completion = borderstyle,
					documentation = borderstyle,
				},
			})
			c.setup.cmdline(":", {
				mapping = c.mapping.preset.cmdline({
					["<C-j>"] = c.mapping.select_next_item(),
					["<C-k>"] = c.mapping.select_prev_item(),
					["<C-o>"] = c.mapping(c.mapping.complete(), { "i", "c" }),
				}),
				sources = c.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			c.setup.cmdline({ "/", "?" }, {
				mapping = c.mapping.preset.cmdline({
					["<C-j>"] = c.mapping(c.mapping.select_next_item(), { "i", "c" }),
					["<C-k>"] = c.mapping(c.mapping.select_prev_item(), { "i", "c" }),
					["<C-o>"] = c.mapping(c.mapping.complete(), { "i", "c" }),
				}),
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "rafamadriz/friendly-snippets" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
