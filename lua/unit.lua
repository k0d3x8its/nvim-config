-- core modules
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- plugin loader
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  install  = { colorscheme = { "dracula" } },
})

