-- LSP server setup
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason-lspconfig.nvim" },
  config = function()
    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      local nmap = function(keys, fn, desc)
        vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc and "LSP: "..desc })
      end
      -- keymaps
      nmap("gd", vim.lsp.buf.definition,     "Go to Definition")
      nmap("K",  vim.lsp.buf.hover,          "Hover Docs")
      nmap("gi", vim.lsp.buf.implementation, "Go to Implementation")
      nmap("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
      nmap("gr", vim.lsp.buf.references,     "Find References")
      nmap("<leader>ld", vim.diagnostic.open_float, "Line Diagnostic")

      -- format on save
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
          buffer = bufnr,
          callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
        })
      end
    end

    -- enhance capabilities for nvim-cmp
    local caps = require("cmp_nvim_lsp").default_capabilities()

    -- list all servers you installed via Mason
    for _, server in ipairs({
      "html", "cssls", "tsserver", "solidity_ls",
      "pyright", "clangd", "arduino_language_server",
      "bashls", "jsonls", "lua_ls",
    }) do
      lspconfig[server].setup {
        on_attach    = on_attach,
        capabilities = caps,
      }
    end
  end,
}

