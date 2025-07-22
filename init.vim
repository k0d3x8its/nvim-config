" ── ~/.config/nvim/init.vim ────────────────────────────────────────────────

" ─── Python3 provider ─────────────────────────────────────────────────────
" Use the venv for Powerline & pynvim
let g:python3_host_prog = '/home/broke/.config/nvim/venv/bin/python'

" ── vim-plug bootstrap ─────────────────────────────────────────────────────
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'								" core statusline
Plug 'vim-airline/vim-airline-themes'						" extra color themes
Plug 'dracula/vim', { 'as': 'dracula' }						" syntax highlighting
Plug 'kyazdani42/nvim-tree.lua'								" sidebar file explorer
Plug 'nvim-tree/nvim-web-devicons'							" icons for sidebar file explorer
Plug 'akinsho/toggleterm.nvim'								" terminal
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}	" Syntax tree–based highlighting
Plug 'dense-analysis/ale'									" Asynchronous linting & fixing
Plug 'williamboman/mason.nvim'								" management of LSP server
Plug 'neovim/nvim-lspconfig'								" core LSP config
Plug 'williamboman/mason-lspconfig.nvim'					" Mason/LSPConfig bridge
Plug 'nvim-lua/plenary.nvim'								" Required dependency for Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }	" Search feature
Plug 'windwp/nvim-autopairs'								" auto close brackets

call plug#end()

" ─── Toggle Tree In Dev Directory ──────────────────────────────────────────
let g:tree_first_open = 1

function! ToggleTreeAtDev()
  if g:tree_first_open
    let g:tree_first_open = 0
    " first time: open tree rooted at ~/Dev
    execute 'NvimTreeOpen ' . expand('~/dev')
  else
    " subsequent times: just toggle (remembers last folder)
    NvimTreeToggle
  endif
endfunction

" ─── Keymaps ───────────────────────────────────────────────────────────────
" Ctrl‑n toggles the sidebar
nnoremap <silent> <C-z> :call ToggleTreeAtDev()<CR>
" Ctrl+a opens Telescope file finder
nnoremap <C-a> :Telescope find_files<CR>
" Alt+, and Alt+. switch between tabs
" previous tab
nnoremap <A-,> :tabprevious<CR>
" next tab
nnoremap <A-.> :tabnext<CR>
" Ctrl+; opens new tab and renames it
nnoremap <C-k> :tabnew<CR>:call RenameCurrentTab()<CR>
" Ctrl+' closes current tab
nnoremap <C-l> :tabclose<CR>
" Allow ESC to exit Terminal insert mode
tnoremap <Esc> <C-\><C-n>

" RenameCurrentTab function (only names if user inputs something)
function! RenameCurrentTab()
  let l:name = input('Tab name: ')
  if !empty(l:name)
    execute 'file ' . l:name
  endif
endfunction

" ─── Basic UI ──────────────────────────────────────────────────────────────
set laststatus=2
set number
set cursorline
set guicursor=a:block-
set t_Co=256
set termguicolors
set background=dark
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set autoindent
set smarttab
set showtabline=2

" ─── Wrap & Indent ─────────────────────────────────────────────────────────
set wrap                 " wrap text visually
set linebreak            " wrap at word boundaries
set breakindent          " keep indent on wrapped lines
set showbreak=↪\         " show ↪ on wrapped lines
set textwidth=0          " don't hard wrap
set formatoptions-=t     " don't auto-insert line breaks

set smartindent
syntax on
colorscheme dracula


" ──- Airline configuration ─────────────────────────────────────────────────
let g:airline_powerline_fonts = 1 "use Powerline-patched glyphs in Airline
let g:airline_theme='dark'

" ─── ALE linting & fixing ───────────────────────────────────────────────────
let g:ale_linters = {
  \ 'python':      ['flake8', 'mypy'],
  \ 'c':           ['gcc'],
  \ 'cpp':         ['g++'],
  \ 'javascript':  ['eslint'],
  \ 'typescript':  ['eslint'],
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \ '*':           ['remove_trailing_lines', 'trim_whitespace'],
  \ 'python':      ['autopep8'],
  \ 'javascript':  ['prettier'],
  \ 'typescript':  ['prettier'],
\}

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_save = 1

" ─── Arduino (.ino) support ─────────────────────────────────────────────────
" Treat .ino sketches as C++ files so Treesitter & ALE apply
autocmd BufRead,BufNewFile *.ino setlocal filetype=cpp

" add cppcheck for extra static analysis on your Arduino code
let g:ale_linters['cpp'] += ['cppcheck']

" if you install Arduino CLI, enable ALE’s built‑in arduino linter
" (requires `arduino-cli` in your PATH and you’ve run `arduino-cli core install …`)
let g:ale_linters['cpp'] += ['arduino']
let g:ale_arduino_executable = 'arduino-cli'
let g:ale_arduino_fqbn = 'arduino:avr:uno'   " change to your board’s FQBN

" ─── Load all your Lua configs from lua/unit.lua ────────────────────────────
lua require('unit')
