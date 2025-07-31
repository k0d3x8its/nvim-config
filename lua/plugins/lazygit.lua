-- ~/.config/nvim/lua/plugins/lazygit.lua
return {
  'kdheepak/lazygit.nvim',
  event = "InsertEnter",-- the Neovim wrapper for LazyGit

  dependencies = { 'nvim-lua/plenary.nvim' }, -- required helper lib
  
  config = function()
    -- Map <leader>gg to open LazyGit
    vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', {
      desc = ' Open LazyGit',
      noremap = true,
      silent = true,
    })
  end,
}
