-- yazi.nvim: open the yazi terminal file manager from Neovim.
-- Requires the `yazi` binary (installed via Homebrew here).
return {
  "mikavilpas/yazi.nvim",
  version = "*", -- latest stable
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    -- `-` opens yazi at the current file (overrides the default "-" motion).
    { "-", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Open yazi at the current file" },
    { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open yazi in the working directory" },
    { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session" },
  },
  ---@type YaziConfig | {}
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
