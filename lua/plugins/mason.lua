-- Mason installer for LSP servers
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup {
      ensure_installed = {
        "pyright", "ts_ls",
        "html", "cssls", "solidity"
      },
      automatic_installation = true,
    }
  end,
}
