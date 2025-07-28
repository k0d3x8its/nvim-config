-- nvim-tree config & first-open toggle
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<C-s>",
      function()
        require("utils.tree_toggle").toggle_at_dev()
      end,
      desc = "Toggle File Tree at ~/dev",
    },
  },
  config = function()
    require("nvim-tree").setup {
      view = { side = "left", width = 30 },
      update_focused_file = { enable = true },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
    }
  end,
}

