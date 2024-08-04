local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

local handlers_setup = function()
	-- Setup language servers.
	local lspconfig = require("lspconfig")
	require("mason-lspconfig").setup()
	local handlers = {
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function(server_name) -- default handler (optional)
			-- if server_name ~= "tsserver" then
			require("lspconfig")[server_name].setup({})
			-- end
		end,
		-- Next, you can provide targeted overrides for specific servers.
		["lua_ls"] = function()
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
		["tsserver"] = function()
			return { enabled = false }
		end,
		-- ["tsserver"] = function()
		-- 	lspconfig.tsserver.setup({
		-- 		single_file_support = false,
		-- 		settings = {
		-- 			typescript = {
		-- 				inlayHints = {
		-- 					includeInlayParameterNameHints = "literal",
		-- 					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
		-- 					includeInlayFunctionParameterTypeHints = true,
		-- 					includeInlayVariableTypeHints = false,
		-- 					includeInlayPropertyDeclarationTypeHints = true,
		-- 					includeInlayFunctionLikeReturnTypeHints = true,
		-- 					includeInlayEnumMemberValueHints = true,
		-- 				},
		-- 			},
		-- 			javascript = {
		-- 				inlayHints = {
		-- 					includeInlayParameterNameHints = "all",
		-- 					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
		-- 					includeInlayFunctionParameterTypeHints = true,
		-- 					includeInlayVariableTypeHints = true,
		-- 					includeInlayPropertyDeclarationTypeHints = true,
		-- 					includeInlayFunctionLikeReturnTypeHints = true,
		-- 					includeInlayEnumMemberValueHints = true,
		-- 				},
		-- 			},
		-- 		},
		-- 		commands = {
		-- 			OrganizeImports = {
		-- 				organize_imports,
		-- 				description = "Organize Imports",
		-- 			},
		-- 		},
		-- 	})
		-- end,
	}
	require("mason-lspconfig").setup_handlers(handlers)
end

local M = {
	"neovim/nvim-lspconfig",
	enabled = _G.enabled.lsp,
	dependencies = {
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		opts = { lsp = { auto_attach = true } },
		keys = { { "<leader>o", mode = { "n" }, "<cmd>Navbuddy<cr>", desc = "toggle Navbuddy" } },
	},
	config = function()
		handlers_setup()

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				-- vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "<space>F", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})
	end,
	opts = {
		diagnostics = {
			virtual_text = false,
		},
	},
}
return M
