-- lua/plugins/ui.lua
return {
  -- Dracula colorscheme (Lua port)
  {
    "Mofiqul/dracula.nvim",
    name     = "dracula",
    lazy     = false, -- load at startup
    priority = 1000,  -- before other plugins
    config   = function()
      local dracula = require("dracula")

      dracula.load() -- sets the colorscheme
    end,
  },

  -- Lualine statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy         = false,
    config       = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status")

      local function lazy_updates_icon_only()
        local updates = lazy_status.updates()
        if updates == "" then return "" end
        local count = updates:match("(%d+)")
        return count .. " "
      end

      lualine.setup({
        options = {
          theme                = "dracula",
          section_separators   = { left = "", right = "" },
          component_separators = { left = " ", right = "" },
        },
        sections = {
          lualine_x = {
            {
              lazy_updates_icon_only,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            "encoding",
            "fileformat",
            "filetype",
          },
        },
      })
    end,
  },
}
