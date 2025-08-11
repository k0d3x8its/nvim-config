-- leader key is Spacebar
vim.g.mapleader = " "

-- custom key mappings
local map = vim.keymap
local function keyopts(desc, extra)
	return vim.tbl_extend("force", { silent = true, noremap = true, desc = desc }, extra or {})
end

-- toggle file explorer with Ctrl+s
map.set("n", "<C-s>", function()
	require("plugins.nvim-tree").toggle_tree_at_dev()
end, keyopts("File explorer"))

-- open telescope file finder in HOME with Ctrl+a
map.set("n", "<C-a>", function()
	require("utils.telescope_home").find_files()
end, keyopts("Find file"))

-- live grep in HOME with Ctrl+f
map.set("n", "<C-f>", function()
	require("utils.telescope_home").live_grep()
end, keyopts("Find word"))

-- navigate tabs with Alt+, / Alt+.
map.set("n", "<A-,>", "<cmd>tabprevious<CR>", keyopts("Previous tab"))
map.set("n", "<A-.>", "<cmd>tabnext<CR>", keyopts("Next tab"))

-- new tab + rename with Ctrl+k
map.set("n", "<C-k>", function()
	vim.cmd("tabnew")
	require("core.autocmds").rename_current_tab()
end, keyopts("Create new tab"))

-- close current tab with Ctrl+l
map.set("n", "<C-l>", "<cmd>tabclose<CR>", keyopts("Close current tab"))

-- exit Terminal mode with Esc
map.set("t", "<Esc>", "<C-\\><C-n>", keyopts("Exit Terminal mode"))

-- open Todos in Telescope with Spacebar+st
map.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", keyopts("Open Todos in Telescope"))

-- cycle through windows in Normal mode with ALT+w
map.set("n", "<A-w>", "<C-w>w", keyopts("Cycle to next window"))

-- in Terminal mode , first go to Normal mode (<C-\\><C-n>), then cycle
map.set("t", "<A-w>", "<C-\\><C-n><C-w>w", keyopts("Cycle to next window (from Terminal mode)"))

-- open Live Preview
map.set("n", "<leader>p", function()
	require("livepreview").open()
end, keyopts("Live Preview: Open"))

-- close Live Preview
map.set("n", "<leader>pc", function()
	require("livepreview").close()
end, keyopts("Live Preview: Close"))

-- toggle Live Preview
map.set("n", "<leader>pt", function()
	require("livepreview").toggle()
end, keyopts("Live Preview: Toggle"))
