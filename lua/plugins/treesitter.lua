-- Treesitter parser installation & setup
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "python", "c", "cpp", "javascript", "typescript",
        "html", "css", "solidity"
      },
      highlight = { enable = true },
      indent    = { enable = true },
    }
  end,
}
