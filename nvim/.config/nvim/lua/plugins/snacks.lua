return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker.win.input.keys["<a-.>"] = { "toggle_hidden", mode = { "i", "n" } }
    opts.scroll = { enabled = false }
    opts.grep = {
      truncate_filenames = false,
      show_full_path = true,
    }
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
      LazyVim.pick("files", { layout = { preset = "vscode" }, hidden = true, truncate = false }),
      desc = "Find Files (cwd)",
    },
    {
      "<leader>fF",
      LazyVim.pick("files", { root = false, layout = { preset = "vscode" }, hidden = true, truncate = false }),
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
