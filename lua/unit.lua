-- Main loader: require every module exactly once

-- core/
require('core.options')   -- UI & editing options
require('core.keymaps')   -- custom keybindings
require('core.autocmds')  -- autocommands & helpers

-- plugins/
require('plugins.nvim-tree')
require('plugins.toggleterm')
require('plugins.treesitter')
require('plugins.mason')
require('plugins.lsp')
require('plugins.autopairs')
require('plugins.ale')
require('plugins.telescope')
require('plugins.noice')
