-- lua/plugins/ui.lua
return {
  -- Dracula colorscheme (Lua port)
  {
    "Mofiqul/dracula.nvim",
    name     = "dracula",
    lazy     = false,    -- load at startup
    priority = 1000,     -- before other plugins
    config = function()
      require("dracula").load()  -- sets the colorscheme
    end,
  },

  -- Lualine statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy         = false,
    config = function()
      require("lualine").setup({
        options = {
          theme            = "dracula",  -- or "catppuccin"
          section_separators   = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
      })
    end,
  },
}

