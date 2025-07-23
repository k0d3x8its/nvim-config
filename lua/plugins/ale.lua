-- ALE linting & fixing configuration

-- Linters per filetype
vim.g.ale_linters = {
  python     = { 'flake8', 'mypy' },
  c          = { 'gcc', 'cppcheck', 'arduino' },
  cpp        = { 'g++', 'cppcheck', 'arduino' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  html       = { 'htmllint' },       -- optional: HTML linter
  css        = { 'stylelint' },      -- optional: CSS linter
  solidity   = { 'solhint' },        -- optional: Solidity linter
}

vim.g.ale_fix_on_save = 1             -- auto-fix on save

-- Fixers per filetype
vim.g.ale_fixers = {
  ['*']        = { 'remove_trailing_lines', 'trim_whitespace' },
  python       = { 'autopep8' },
  javascript   = { 'prettier' },
  typescript   = { 'prettier' },
  html         = { 'prettier' },      -- if you prefer prettier for HTML
  css          = { 'prettier' },      -- prettier for CSS
}

-- Lint as you type & on save
vim.g.ale_lint_on_text_changed = 'always'
vim.g.ale_lint_on_save         = 1

-- Arduino-CLI integration
vim.g.ale_arduino_executable = 'arduino-cli'
vim.g.ale_arduino_fqbn       = 'arduino:avr:uno'
