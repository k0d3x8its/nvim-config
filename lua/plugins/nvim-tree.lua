-- nvim-tree config & first-open toggle
return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<C-s>", function()
        require("plugins.nvim-tree").toggle_tree_at_dev()
      end, desc = "Toggle File Tree at ~/dev" },
  },
  config = function()
    local api = require("nvim-tree.api")
    local mod = { first = true }

    require("nvim-tree").setup {
      view = { side = "left", width = 28 },
      update_focused_file = { enable = true },
    }

    function mod.toggle_tree_at_dev()
      if mod.first then
        mod.first = false
        api.tree.open({ path = vim.fn.expand("~/dev") })
      else
        api.tree.toggle()
      end
    end

    -- Export toggle function
    package.loaded["plugins.nvim-tree"] = mod
  end,
}
