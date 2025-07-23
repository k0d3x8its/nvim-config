" ── ~/.config/nvim/init.vim ────────────────────────────────────────────────

" ─── Python3 provider ──────────────────────────────────────────────────────

" Use the venv for Powerline & pynvim ───────────────────────────────────────
let g:python3_host_prog = '/home/broke/.config/nvim/venv/bin/python'

"─────────── vim-plug plugin list ───────────
call plug#begin(stdpath('data') . '/plugged')

  Plug 'vim-airline/vim-airline'                              " Statusline
  Plug 'vim-airline/vim-airline-themes'                       " Airline themes
  Plug 'dracula/vim', { 'as': 'dracula' }                     " Dracula colorscheme
  Plug 'kyazdani42/nvim-tree.lua'                             " File explorer sidebar
  Plug 'nvim-tree/nvim-web-devicons'                          " File icons
  Plug 'akinsho/toggleterm.nvim'                              " Toggleable terminal
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter parsers
  Plug 'dense-analysis/ale'                                   " Asynchronous lint/fix
  Plug 'williamboman/mason.nvim'                              " Installer for LSP/etc.
  Plug 'neovim/nvim-lspconfig'                                " Core LSP configs
  Plug 'williamboman/mason-lspconfig.nvim'                    " Mason ↔ LSPConfig bridge
  Plug 'nvim-lua/plenary.nvim'                                " Utility functions
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }    " Fuzzy finder
  Plug 'windwp/nvim-autopairs'                                " Auto-close brackets/quotes

call plug#end()                                               " End plugin block

" Hand off everything else to Lua
lua require('unit')
