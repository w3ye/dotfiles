-- snacks.nvim: a collection of small QoL modules.
-- Enabled features: bigfile, indent, input, lazygit, picker, quickfile, rename,
-- scope, scratch, statuscolumn, toggle, util, win, words.
-- Keymaps mirror LazyVim's defaults but call Snacks.* directly (no LazyVim distro).
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false, -- bigfile/quickfile/indent/scope/statuscolumn must load at startup
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true }, -- disable heavy features for very large files
    indent = { enabled = true }, -- indent guides + animated scope
    input = { enabled = true }, -- better vim.ui.input
    picker = { enabled = true }, -- fuzzy picker (files, grep, symbols, git, …)
    quickfile = { enabled = true }, -- render file before plugins load
    scope = { enabled = true }, -- scope text objects + jumps
    scratch = { enabled = true }, -- scratch buffers
    statuscolumn = { enabled = true }, -- pretty status/number column
    words = { enabled = true }, -- LSP reference navigation with ]] and [[
    -- util and win are always-available libraries (Snacks.util / Snacks.win),
    -- and lazygit / rename / toggle are on-demand APIs used by the keymaps below.
  },
  -- stylua: ignore
  keys = {
    -- top pickers
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    -- git
    { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (hunks)" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gb", function() Snacks.picker.git_log_line() end, desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git File History" },
    -- lazygit
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gG", function() Snacks.lazygit({ cwd = vim.fn.getcwd() }) end, desc = "Lazygit (cwd)" },
    -- search
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, mode = { "n", "x" }, desc = "Grep Word/Selection" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- scratch
    { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- rename (also propagates LSP will-rename)
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- buffer delete (keeps window layout)
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete Other Buffers" },
    -- words: jump between LSP references
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- Toggle mappings (LazyVim's <leader>u* set). Must run after setup.
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle
      .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
      :map("<leader>uc")
    Snacks.toggle.treesitter():map("<leader>uT")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    Snacks.toggle.indent():map("<leader>ug")
    Snacks.toggle.scroll():map("<leader>uS")
    Snacks.toggle.dim():map("<leader>uD")
    Snacks.toggle.zen():map("<leader>uz")
    Snacks.toggle.zoom():map("<leader>uZ"):map("<leader>wm")
    if vim.lsp.inlay_hint then
      Snacks.toggle.inlay_hints():map("<leader>uh")
    end
  end,
}
