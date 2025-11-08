return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  lazy = false,

  config = function()
    local todo_comments = require("todo-comments")

    todo_comments.setup {
      -- Your custom keywords here if needed
      keywords = {
        TODO = { icon = " ", color = "info" },
        FIX = { icon = " ", color = "error" },
        BUG = { icon = " ", color = "error" },
        HACK = { icon = " ", color = "warning" },
        NOTE = { icon = " ", color = "hint" },
        WARN = { icon = " ", color = "warning" },
        OPTIMIZE = { icon = " ", color = "warning" },
      },
    }
  end,
}
