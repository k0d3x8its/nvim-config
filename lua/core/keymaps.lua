-- leader key is Spacebar
vim.g.mapleader = " "

-- custom key mappings
local map = vim.keymap
--local wkey = require("which-key")

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

-- Live Preview keymap toggle
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "asciidoc", "html", "svg" },
	callback = function(event)
		local bufnr = event.buf

		map.set("n", "<leader>p", "<cmd>LivePreview start<CR>", keyopts("Live Preview: Toggle", { buffer = bufnr }))
	end,
	desc = "Live Preview keymaps",
})

-- Search all keymaps (Telescope)
map.set("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", keyopts("Search Keymaps"))

local mod = {}

function mod.register_whichkey()
	local ok, wkey = pcall(require, "which-key")
	if not ok then
		return
	end

	wkey.add({
		{ "<leader>s", group = "search" },
		{ "<leader>g", group = "git" },
		-- NOTE: add more groups only when adding sub-commands under a prefix
		-- ["<leader>b"] = { name = "+buffer" },
		-- ["<leader>p"] = { name = "+preview" },
	})
	-- annotate non-leader keys so they appear in global which-key help
	wkey.add({
		{ "<C-s>", desc = "File explorer", mode = "n" },
		{ "<C-a>", desc = "Find file (HOME)", mode = "n" },
		{ "<C-f>", desc = "Live Grep (HOME)", mode = "n" },
		{ "<A-,>", desc = "Previous tab", mode = "n" },
		{ "<A-.>", desc = "Next tab", mode = "n" },
		{ "<C-k>", desc = "New tab + rename", mode = "n" },
		{ "<C-l>", desc = "Close current tab", mode = "n" },
		{ "<A-w>", desc = "Cycle windows", mode = { "n", "t" } },
		{ "<Esc>", desc = "Exit Terminal mode", mode = "t" },
		{ "<leader>st", desc = "Open Todos (Telescope)", mode = "n" },
	})
end

return mod
