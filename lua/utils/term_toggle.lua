-- lua/utils/term_toggle.lua

local mod = {}
local Terminal = require("toggleterm.terminal").Terminal

-- one persistent “dev” terminal
local dev_term = Terminal:new {
  cmd             = vim.o.shell,
  dir             = vim.fn.expand("~/dev"),
  direction       = "horizontal",
  size            = 10,
  start_in_insert = true,
  close_on_exit   = false,
  hidden          = true,
}

--- Toggle the dev terminal
function mod.toggle_dev()
  dev_term:toggle()
end

return mod

