-- bridges mason.nvim ↔ nvim-lspconfig
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "html", "cssls", "tsserver", "solidity_ls",
        "pyright", "clangd", "arduino_language_server",
        "bashls", "jsonls", "lua_ls",
      },
    }
  end,
}
