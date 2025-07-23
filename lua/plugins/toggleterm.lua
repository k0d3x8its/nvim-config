-- toggleterm config & persistent “dev” terminal
require('toggleterm').setup {
  open_mapping    = [[<c-x>]],  -- Ctrl+x toggles terminal
  direction       = "horizontal",
  size            = 10,
  start_in_insert = true,
  close_on_exit   = false,
}

-- persistent “dev” terminal always in ~/dev
local Terminal = require('toggleterm.terminal').Terminal
local dev_term = Terminal:new {
  cmd             = vim.o.shell,
  dir             = vim.fn.expand('~/dev'),
  direction       = "horizontal",
  size            = 10,
  start_in_insert = true,
  close_on_exit   = false,
  hidden          = true,
}

vim.keymap.set('n', '<C-x>', function() dev_term:toggle() end,
  { noremap = true, silent = true })
