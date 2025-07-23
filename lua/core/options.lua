-- UI & editing settings
local opt = vim.opt          -- shorthand for vim.opt[...]

-- statusline & tabs
opt.laststatus  = 2          -- always show statusline
opt.showtabline = 2          -- always show tabline

-- line numbers & cursor
opt.number      = true       -- show absolute line numbers
opt.cursorline  = true       -- highlight current line

-- colors & theme
opt.termguicolors = true     -- enable true color support
vim.cmd('colorscheme dracula') -- set Dracula theme

-- tabs & indentation
opt.tabstop     = 2          -- a <Tab> equals 2 spaces
opt.shiftwidth  = 2          -- auto-indent to 2 spaces
opt.softtabstop = 2          -- make tab key insert 2 spaces
opt.expandtab   = true       -- convert tabs to spaces
opt.smartindent = true       -- smart auto-indent
opt.autoindent  = true       -- indent new lines like previous

-- wrapping & formatting
opt.wrap        = true       -- wrap long lines
opt.linebreak   = true       -- wrap at word boundaries
opt.breakindent = true       -- maintain indent on wrapped lines
opt.showbreak   = '↪ '        -- prepend continue lines with ↪
opt.textwidth   = 0          -- disable hard wrapping
opt.formatoptions:remove('t')-- don't auto-wrap text
