return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
        }
      },
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {})
        end,
        openai = function()
          return require("codecompanion.adapters").extend("openai", {})
        end,
      },
    })
  end,
  keys = {
    { "<leader>cp", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat Toggle" },
    { "<leader>cn", "<cmd>CodeCompanionChat<cr>",        desc = "CodeCompanion Chat New" },
    { "<leader>ci", "<cmd>CodeCompanionActions<cr>",     desc = "CodeCompanion Actions",    mode = { "n", "v" }, },
  }
}
