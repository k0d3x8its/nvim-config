-- LSP server setup
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local servers = {
      "pyright", "ts_ls", "clangd",
      "html", "cssls", "solidity"
    }

    for _, srv in ipairs(servers) do
      lspconfig[srv].setup({})
    end
  end,
}
