-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "snacks"
vim.opt.wrap = true

vim.api.nvim_create_user_command("Crpath", function()
  vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%"), ":.") })
end, {})

vim.api.nvim_create_user_command("Cfname", function()
  vim.api.nvim_call_function("setreg", { "+", vim.fn.expand("%:t") })
end, {})
