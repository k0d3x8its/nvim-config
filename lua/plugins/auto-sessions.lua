return {
  "rmagatti/auto-session",
  lazy = false,

  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({

      auto_restore_enabled = false,
      auto_save_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/pictures/", "~/Downloads/", "/" },
    })

    -- Guard: avoid E517 when there are no listed buffers before restore
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSessionRestorePre",
      callback = function()
        local listed_buffer_exists = false

        for _, buffer_handle in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buffer_handle].buflisted then
            listed_buffer_exists = true
            break
          end
        end

        if listed_buffer_exists then
          pcall(vim.cmd, "silent! %bwipeout!")
        end
      end,
    })

    local keymap = vim.keymap

    -- restore last workspace session for current directory
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })

    -- save workspace session for current working directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
  end,
}
