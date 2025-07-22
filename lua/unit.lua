-- ── ~/.config/nvim/lua/unit.lua ────────────────────────────────────────────

-- nvim-tree setup ───────────────────────────────────────────────────────────
require'nvim-tree'.setup {
  view = { side = 'left', width = 28 },
  update_focused_file = { enable = true },
}

-- toggleterm setup ──────────────────────────────────────────────────────────

-- Core toggleterm setup
require("toggleterm").setup({
  open_mapping    = [[<c-x>]],
  direction       = "horizontal",
  size            = 10,
  start_in_insert = true,
  close_on_exit   = false,
})

-- Create one persistent “dev” terminal that always starts in ~/dev
local Terminal = require("toggleterm.terminal").Terminal
local dev_term = Terminal:new({
  cmd             = vim.o.shell,                  -- your default shell
  dir             = vim.fn.expand("~/dev"),   -- applied on first creation
  direction       = "horizontal",
  size            = 10,
  start_in_insert = true,
  close_on_exit   = false,                        -- typing `exit` won’t kill it
  hidden          = true,                         -- stays hidden until you toggle
})

-- Map <C-x> to toggle that exact same terminal buffer
vim.keymap.set("n", "<C-x>", function()
  dev_term:toggle()
end, { noremap = true, silent = true })

-- Treesitter setup ──────────────────────────────────────────────────────────
require('nvim-treesitter.configs').setup {
  ensure_installed = { "python", "c", "cpp", "javascript",
                       "typescript", "solidity", "html", "css"},
  highlight        = { enable = true },
  indent           = { enable = true },
}

-- Mason + mason-lspconfig + lspconfig ───────────────────────────────────────
require('mason').setup()
require("mason-lspconfig").setup({
  ensure_installed     = { "pyright", "ts_ls" },
  automatic_installation = true,
})
local lspconfig = require("lspconfig")
for _, server in ipairs({ "pyright", "ts_ls", "clangd" }) do
  lspconfig[server].setup{}
end

require("nvim-autopairs").setup {}
