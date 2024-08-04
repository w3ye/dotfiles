-- highlight move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor stay in middle with scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- search cursor stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Y", "yy")
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- toggles
vim.keymap.set("n", "<F1>", "<cmd>set relativenumber!<cr>")
vim.keymap.set("n", "<F2>", "<cmd>set hlsearch!<cr>")

-- pressing tab in normal mode split buffers
vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>")
-- <C-y> maps to <Shift-tab> in warp for some reason
vim.keymap.set("n", "<s-tab>", "<cmd>bprevious<cr>")

vim.keymap.set("n", "<M-right>", "<C-w>>", { silent = true })
vim.keymap.set("n", "<M-left>", "<C-w><", { silent = true })
vim.keymap.set("n", "<M-up>", "<C-w>+", { silent = true })
vim.keymap.set("n", "<M-down>", "<C-w>-", { silent = true })

-- highlight move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
