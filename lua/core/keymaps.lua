-- leader key is Spacebar
vim.g.mapleader = " "

-- custom key mappings
local map = vim.keymap
local opts = { silent = true }

-- toggle file explorer with Ctrl+z
map.set('n', '<C-z>', '<cmd>lua require("plugins.nvim-tree").toggle_tree_at_dev()<CR>', opts, { desc = "File explorer" })

-- open telescope file finder in HOME with Ctrl+a
map.set('n', '<C-a>', '<cmd>lua require("utils.telescope_home").find_files()<CR>', opts, { desc = "Find file" })

-- live grep in HOME with Ctrl+f
map.set('n', '<C-f>', '<cmd>lua require("utils.telescope_home").live_grep()<CR>', opts, { desc = "Find word" })

-- navigate tabs with Alt+, / Alt+.
map.set('n', '<A-,>', '<cmd>tabprevious<CR>', opts, { desc = "Previous tab" })
map.set('n', '<A-.>', '<cmd>tabnext<CR>', opts, { desc = "Next tab" })

-- new tab + rename with Ctrl+k
map.set('n', '<C-k>', '<cmd>tabnew<CR><cmd>lua require("core.autocmds").rename_current_tab()<CR>', opts, { desc = "New tab" })

-- close current tab with Ctrl+l
map.set('n', '<C-l>', '<cmd>tabclose<CR>', opts, { desc = "Close tab" })

-- exit terminal-mode with Esc
map.set('t', '<Esc>', '<C-\\><C-n>', opts, { desc = "Exit terminal-mode" })

-- open Todos in Telescope with Spacebar+st
map.set('n', '<leader>st', '<cmd>TodoTelescope<CR>', opts, { desc = "Open Todos in Telescope" })
