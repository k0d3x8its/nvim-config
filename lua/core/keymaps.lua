-- leader key
vim.g.mapleader = " "

-- custom key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- toggle file explorer with Ctrl+z
map('n', '<C-z>',
  '<cmd>lua require("plugins.nvim-tree").toggle_tree_at_dev()<CR>',
  opts)
map('n', '<C-z>', '<cmd>lua require("plugins.nvim-tree").toggle_tree_at_dev()<CR>', opts)

-- open telescope file finder with Ctrl+a
map('n', '<C-a>', '<cmd>Telescope find_files<CR>', opts)

-- navigate tabs with Alt+, / Alt+.
map('n', '<A-,>', '<cmd>tabprevious<CR>', opts)
map('n', '<A-.>', '<cmd>tabnext<CR>', opts)

-- new tab + rename with Ctrl+k
map('n', '<C-k>',
  '<cmd>tabnew<CR><cmd>lua require("core.autocmds").rename_current_tab()<CR>',
  opts)

-- close current tab with Ctrl+l
map('n', '<C-l>', '<cmd>tabclose<CR>', opts)

-- exit terminal-mode with Esc
map('t', '<Esc>', '<C-\\><C-n>', opts)
