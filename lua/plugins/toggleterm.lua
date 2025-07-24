-- toggleterm config & persistent “dev” terminal
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-x>", function()
        require("plugins.toggleterm").toggle_dev()
      end, desc = "Toggle Dev Terminal" },
  },
  config = function()
    require("toggleterm").setup {
      open_mapping    = [[<c-x>]],
      direction       = "horizontal",
      size            = 10,
      start_in_insert = true,
      close_on_exit   = false,
    }

    local Terminal = require("toggleterm.terminal").Terminal
    local dev_term = Terminal:new {
      cmd             = vim.o.shell,
      dir             = vim.fn.expand("$HOME/dev"),
      direction       = "horizontal",
      size            = 10,
      start_in_insert = true,
      close_on_exit   = false,
      hidden          = true,
    }

    local mod = {}
    function mod.toggle_dev()
      dev_term:toggle()
    end

    -- Export
    package.loaded["plugins.toggleterm"] = mod
  end,
}
