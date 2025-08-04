-- LSP server configuration
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",                                   -- for autocompletion capabilities
    { "antosha417/nvim-lsp-file-operations", config = true }, -- file ops for LSP
  },

  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    -- import cmp-nvim-lsp plugin for enhanced completion capabilities
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- keymap options
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- on_attach function for keymaps and formatting
    local on_attach = function(client, bufnr)
      local nmap = function(keys, fn, desc)
        vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc and "LSP: " .. desc })
      end

      -- keymaps
      nmap("gd", vim.lsp.buf.definition, "Go to Definition")
      nmap("K", vim.lsp.buf.hover, "Hover Docs")
      nmap("gi", vim.lsp.buf.implementation, "Go to Implementation")
      nmap("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
      nmap("gr", vim.lsp.buf.references, "Find References")
      nmap("<leader>ld", vim.diagnostic.open_float, "Line Diagnostic")

      -- format on save
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    vim.diagnostic.config({
      virtual_text = true, -- show inline error text
      underline    = true, -- underline errors in the buffer
      signs        = {
        -- define one gutter icon per severity
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.INFO]  = " ",
          [vim.diagnostic.severity.HINT]  = " ",
        },
        -- optionally tweak the highlight groups (uses built-in groups by default)
        texthl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
          [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
          [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
        },
      },
    })

    -- list all servers you installed via Mason (basic setup only)
    for _, server in ipairs({
      "html", "cssls", "ts_ls", "solidity_ls",
      "pyright", "clangd", "arduino_language_server",
      "bashls", "jsonls",
    }) do
      lspconfig[server].setup({
        on_attach    = on_attach,
        capabilities = capabilities,
      })
    end

    -- configure lua_ls server (with diagnostics fix for `vim`)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }, -- fixes: undefined global `vim`
          },
        },
      },
    })
  end,
}
