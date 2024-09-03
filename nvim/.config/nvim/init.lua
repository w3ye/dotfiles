-- require("init")
require("config.lazy")
require("keymaps.keymaps")
local vim = vim

-- vim.cmd.colorscheme("catppuccin-mocha")

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.autochdir = false

vim.opt.wrap = true
vim.opt.fixendofline = true
vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 4

-- vim.opt.foldmethod = "manual"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevel = 20
-- vim.api.nvim_create_autocmd("BufRead", {
-- 	callback = function()
-- 		vim.api.nvim_create_autocmd("BufWinEnter", {
-- 			once = true,
-- 			command = "normal! zx",
-- 		})
-- 		vim.api.nvim_create_autocmd("BufWrite", {
-- 			once = true,
-- 			command = "normal! zx",
-- 		})
-- 	end,
-- })
--
local severity = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = false,
	underline = false,
	signs = {
		text = {
			[severity.ERROR] = "",
			[severity.WARN] = " ",
			[severity.HINT] = " ",
			[severity.INFO] = " ",
		},
	},
})

vim.api.nvim_create_user_command("Crpath", function()
	vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%"), ":.") })
end, {})

vim.api.nvim_create_user_command("Cfname", function()
	vim.api.nvim_call_function("setreg", { "+", vim.fn.expand("%:t") })
end, {})
