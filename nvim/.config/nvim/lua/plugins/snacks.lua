return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker.win.input.keys["<a-.>"] = { "toggle_hidden", mode = { "i", "n" } }
    opts.scroll = { enabled = false }
    -- default filters applied to every invocation of these sources,
    -- regardless of which keymap/command triggers them
    opts.picker.sources = opts.picker.sources or {}
    opts.picker.sources.files = vim.tbl_extend("force", opts.picker.sources.files or {}, {
      hidden = true,
      ignored = false,
    })
    opts.picker.sources.grep = vim.tbl_extend("force", opts.picker.sources.grep or {}, {
      hidden = true,
      ignored = false,
    })
    -- exclude test/spec files from word search by default; <a-e> in the picker toggles them back in
    local test_globs = {
      "*.test.*",
      "*.spec.*",
      "*_test.*",
      "*_spec.*",
      "*Test.*",
      "*Spec.*",
      "**/__tests__/**",
      "**/test/**",
      "**/tests/**",
      "**/spec/**",
    }
    opts.picker.sources.grep_word = vim.tbl_deep_extend("force", opts.picker.sources.grep_word or {}, {
      tests = false, -- true = include test files
      toggles = { tests = "T" }, -- title badge when test files are included
      -- derive `exclude` from `tests` so resume/explicit `{ tests = true }` stay consistent
      config = function(o)
        o.exclude = o.tests and {} or test_globs
      end,
      actions = {
        toggle_test_files = function(picker)
          picker.opts.tests = not picker.opts.tests
          picker.opts.exclude = picker.opts.tests and {} or test_globs
          picker.list:set_target()
          picker:find()
        end,
      },
      win = {
        input = {
          keys = { ["<a-e>"] = { "toggle_test_files", mode = { "i", "n" }, desc = "Toggle Test Files" } },
        },
      },
    })
    -- full (untruncated) paths in results
    opts.picker.formatters = opts.picker.formatters or {}
    opts.picker.formatters.file = opts.picker.formatters.file or {}
    opts.picker.formatters.file.truncate = false
    return opts
  end,
  keys = {
    {
      "<leader><space>",
      LazyVim.pick("smart", {
        multi = { "buffers", "recent", "files" },
        format = "file", -- use `file` format for all sources
        matcher = {
          cwd_bonus = true, -- boost cwd matches
          frecency = true, -- use frecency boosting
          sort_empty = true, -- sort even when the filter is empty
        },
        transform = "unique_file",
        layout = { preset = "vscode" },
      }),
      desc = "Smart Find Files",
    },
    {
      "<leader>ff",
      LazyVim.pick("files", { layout = { preset = "vscode" } }),
      desc = "Find Files (cwd)",
    },
    {
      "<leader>fF",
      LazyVim.pick("files", { root = false, layout = { preset = "vscode" } }),
      desc = "Find Files",
    },
    {
      "<leader>sw",
      LazyVim.pick("grep_word", { regex = true }),
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    {
      "<leader>sW",
      LazyVim.pick("grep_word", { root = false }),
      desc = "Visual selection or word (cwd)",
      mode = { "n", "x" },
    },
  },
}
