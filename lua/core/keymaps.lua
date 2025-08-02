-- leader key
vim.g.mapleader = " "

-- custom key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- toggle file explorer with Ctrl+z
map('n', '<C-z>', '<cmd>lua require("plugins.nvim-tree").toggle_tree_at_dev()<CR>', opts)


-- navigate tabs with Alt+, / Alt+.
map('n', '<A-,>', '<cmd>tabprevious<CR>', opts)
map('n', '<A-.>', '<cmd>tabnext<CR>', opts)

-- new tab + rename with Ctrl+k

-- close current tab with Ctrl+l
map('n', '<C-l>', '<cmd>tabclose<CR>', opts)

-- exit terminal-mode with Esc
map('t', '<Esc>', '<C-\\><C-n>', opts)
