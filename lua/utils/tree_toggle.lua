local mod = { first = true }
local api = require('nvim-tree.api')

function mod.toggle_at_dev()
  if mod.first then
    mod.first = false
    api.tree.open({ path = vim.fn.expand("~/dev") })
  else
    api.tree.toggle()
  end
end

return mod

