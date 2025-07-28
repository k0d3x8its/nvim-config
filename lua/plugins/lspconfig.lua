return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true},
  },

  config = function()
    -- TODO: configure keymapping

    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
    end

    -- used to eanble autocompletion (assign to every lsp sever config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- TODO: add icons for signs from font awesome
    vim.diagnostic.config({
      virtual_text = true,   -- show inline error text
      underline    = true,   -- underline errors in the buffer
      signs        = {
        -- define one gutter icon per severity
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.INFO]  = " ",
          [vim.diagnostic.severity.HINT]  = " ",
        },
        -- optionally tweak the highlight groups (uses built‑in groups by default)
        texthl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
          [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
          [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
        },
      },
    })

    -- configure html server
    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- ✅ configure lua_ls server
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim" }, -- fixes: undefined global `vim`
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    --TODO: add the rest of the lsp servers for languages

  end,
}
