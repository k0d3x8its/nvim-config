-- Treesitter parser installation & setup
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python", "c", "cpp", "javascript", "typescript",
    "html", "css", "solidity"            -- added HTML, CSS, Solidity
  },
  highlight = { enable = true },        -- enable syntax highlighting
  indent    = { enable = true },        -- enable smart indent
}
