return {
	"rmagatti/auto-session",
	event = "VimEnter",
	lazy = false,

	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore = false,
			suppresse_dirs = { "~/", "~/pictures/" },
		})

		local keymap = vim.keymap

		-- restore last workspace session for current directory
		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })

		-- save workspace session for current working directory
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
	end,
}
