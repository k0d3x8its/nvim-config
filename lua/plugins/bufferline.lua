return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  event = "VimEnter",

  config = function ()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "tabs",
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = "slant",
      },
    })
  end,
}
