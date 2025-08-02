-- Treesitter parser installation & setup
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()

    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup {
      ensure_installed = {
        "python", "c", "cpp", "javascript", "typescript",
        "html", "css", "solidity", "lua", "markdown", "bash",
      },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true},
    }
  end,
}
