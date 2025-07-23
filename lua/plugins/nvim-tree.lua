-- nvim-tree config & first-open toggle
local api = require('nvim-tree.api')
local mod = { first = true }

-- Base setup
require('nvim-tree').setup {
  view = { side = 'left', width = 28 },
  update_focused_file = { enable = true },
}

-- On first toggle, open at ~/dev; thereafter just toggle
function mod.toggle_tree_at_dev()
  if mod.first then
    mod.first = false
    api.tree.open({ path = vim.fn.expand('~/dev') })
  else
    api.tree.toggle()
  end
end

return mod
