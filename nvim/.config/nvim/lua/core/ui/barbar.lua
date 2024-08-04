local opts = { noremap = true, silent = true }
local M = {
	"romgrk/barbar.nvim",
	event = "VimEnter",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("barbar").setup({
			icons = {
				pinned = { button = "", filename = true },
			},
		})
	end,
	keys = {
		-- Move to previous/next
		{ "<M-,>", "<Cmd>BufferPrevious<CR>", opts },
		{ "<M-.>", "<Cmd>BufferNext<CR>", opts },
		-- Re-order to previous/next
		{ "<M-[>", "<Cmd>BufferMovePrevious<CR>", opts },
		{ "<M-]>", "<Cmd>BufferMoveNext<CR>", opts },
		-- Goto buffer in position...
		{ "<M-1>", "<Cmd>BufferGoto 1<CR>", opts },
		{ "<M-2>", "<Cmd>BufferGoto 2<CR>", opts },
		{ "<M-3>", "<Cmd>BufferGoto 3<CR>", opts },
		{ "<M-4>", "<Cmd>BufferGoto 4<CR>", opts },
		{ "<M-5>", "<Cmd>BufferGoto 5<CR>", opts },
		{ "<M-6>", "<Cmd>BufferGoto 6<CR>", opts },
		{ "<M-7>", "<Cmd>BufferGoto 7<CR>", opts },
		{ "<M-8>", "<Cmd>BufferGoto 8<CR>", opts },
		{ "<M-9>", "<Cmd>BufferGoto 9<CR>", opts },
		{ "<M-0>", "<Cmd>BufferLast<CR>", opts },
		-- Pin/unpin buffer
		{ "<M-p>", "<Cmd>BufferPin<CR>", opts },
		-- Close buffer
		{ "<leader>d", "<Cmd>BufferClose<CR>", opts },
		{ "<leader>D", "<Cmd>BufferCloseAllButCurrent<CR>", opts },
		-- Wipeout buffer
		--                 :BufferWipeout
		-- Close commands
		--                 :BufferCloseAllButCurrent
		--                 :BufferCloseAllButPinned
		--                 :BufferCloseAllButCurrentOrPinned
		--                 :BufferCloseBuffersLeft
		--                 :BufferCloseBuffersRight
		-- Magic buffer-picking mode
		{ "<C-g>", "<Cmd>BufferPick<CR>", opts },
		-- Sort automatically by...
		{ "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts },
		{ "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts },
		{ "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts },
		{ "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts },
		{ "<leader>D", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts },
		{ "<leader>db", "<Cmd>BufferCloseAllButVisible<CR>", opts },
	},
}

return M
