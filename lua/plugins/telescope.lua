-- Basic Telescope defaults
return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  cmd = "Telescope",
  config = function()
    require("telescope").setup {
      defaults = {
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading",
          "--with-filename", "--line-number",
          "--column", "--smart-case"
        },
        prompt_prefix   = "🔍 ",
        selection_caret = "➤ ",
        path_display    = { "smart" },
      },
    }
  end,
}
