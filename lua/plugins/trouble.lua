-- lua/plugins/trouble.lua
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      icons = true,
      use_diagnostic_signs = true, -- uses signs defined by LSP or :sign define
    })
  end,
  cmd = "TroubleToggle", -- lazy-load on command
}

