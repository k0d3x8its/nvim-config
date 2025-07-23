-- LSP server setup
local lspconfig = require('lspconfig')
local servers = {
  "pyright", "ts_ls", "clangd",     -- existing
  "html", "cssls", "solidity"          -- added HTML, CSS & Solidity
}

for _, srv in ipairs(servers) do
  lspconfig[srv].setup {}            -- default setup for each
end
