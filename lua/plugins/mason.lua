-- Mason installer for LSP servers
require('mason').setup()

require('mason-lspconfig').setup {
  ensure_installed      = {
    "pyright", "ts_ls",          -- existing servers
    "html", "cssls", "solidity"     -- added HTML, CSS & Solidity
  },
  automatic_installation = true,
}
