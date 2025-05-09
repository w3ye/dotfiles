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
          slash_commands = {
            buffer = {
              opts = {
                -- provider = "mini_pick"
                -- provider = "telescope",
              },
            },
            file = {
              opts = {
                -- provider = "mini_pick"
                -- provider = "telescope",
              },
            },
          },
        },
        inline = {
          adapter = "anthropic",
        },
      },
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "cmd:op read op://personal/Anthropic/credential --no-newline",
            },
          })
        end,
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            api_key = "cmd:op read op://personal/OpenAI/credential --no-newline",
          })
        end,
      },
    })
  end,
  keys = {
    { "<leader>cp", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat Toggle" },
    { "<leader>cn", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat New" },
    { "<leader>ci", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions", mode = { "n", "v" } },
  },
}
