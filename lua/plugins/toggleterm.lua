return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<C-x>",
      function()
        require("utils.term_toggle").toggle_dev()
      end,
      desc = "Toggle Dev Terminal",
    },
  },
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup {
      open_mapping    = [[<c-x>]],
      direction       = "horizontal",
      size            = 15,
      start_in_insert = true,
      close_on_exit   = false,
    }
  end,
}
