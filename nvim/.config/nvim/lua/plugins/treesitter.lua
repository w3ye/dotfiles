-- Treesitter (main branch — the maintained rewrite; master is archived).
-- Provides parsers; Neovim itself provides highlighting via vim.treesitter.start().
-- Plus rainbow-delimiters for colored matching brackets/parens.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- master is archived and its parsers/queries drift out of sync
    lazy = false, -- main branch does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Install the parsers we want (async; downloads + compiles on first run).
      require("nvim-treesitter").install({
        -- requested languages
        "typescript",
        "tsx",
        "javascript",
        "go",
        "gomod",
        "gosum",
        "sql",
        "java",
        "python",
        -- config/support languages
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
        "bash",
        "regex",
      })

      -- Enable treesitter highlighting + indentation for any buffer whose
      -- language has an installed parser. pcall guards filetypes without one.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          if pcall(vim.treesitter.start, ev.buf) then
            -- experimental treesitter-based indentation (per main README)
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  {
    -- Rainbow brackets, driven by treesitter. Requires termguicolors (set in options.lua).
    -- Docs: :help rainbow-delimiters
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("rainbow-delimiters.setup").setup({})
    end,
  },
}
