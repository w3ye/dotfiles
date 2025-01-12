require("config.lazy")
require("keymaps.keymaps")
local vim = vim

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.mouse = "n"

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

vim.api.nvim_create_user_command("Crpath", function()
	vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%"), ":.") })
end, {})

vim.api.nvim_create_user_command("Cfname", function()
	vim.api.nvim_call_function("setreg", { "+", vim.fn.expand("%:t") })
end, {})
