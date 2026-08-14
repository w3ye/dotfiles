-- Editor options. See `:help option-list`.
local opt = vim.opt

opt.number = true -- absolute line number on the cursor line
opt.relativenumber = true -- relative numbers everywhere else
opt.mouse = "a" -- mouse in all modes
opt.showmode = false -- statusline shows mode, don't duplicate
opt.clipboard = "unnamedplus" -- use system clipboard
opt.breakindent = true -- wrapped lines keep indentation

opt.undofile = true -- persistent undo
opt.ignorecase = true -- case-insensitive search...
opt.smartcase = true -- ...unless the query has capitals

opt.signcolumn = "yes" -- always show sign column (avoids text shift)
opt.updatetime = 250 -- faster CursorHold / diagnostics
opt.timeoutlen = 500 -- ms to wait for a mapped sequence to complete (default 1000)
opt.splitright = true -- vertical splits open to the right
opt.splitbelow = true -- horizontal splits open below

opt.list = true -- show some invisible characters
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split" -- live preview of :substitute
opt.cursorline = true -- highlight the current line
opt.scrolloff = 8 -- keep 8 lines above/below the cursor

-- Indentation: 2 spaces by default (per-language overrides via ftplugin/treesitter).
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Required for rainbow-delimiters and modern colorschemes to render true color.
opt.termguicolors = true

-- Put Mason-installed CLIs (e.g. the tree-sitter CLI needed to build some
-- treesitter parsers) on PATH before plugins load.
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
