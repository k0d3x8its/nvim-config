-- Basic Telescope defaults
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg','--color=never','--no-heading',
      '--with-filename','--line-number',
      '--column','--smart-case'
    },
    prompt_prefix    = '🔍 ',
    selection_caret  = '➤ ',
    path_display     = { 'smart' },
  },
}
