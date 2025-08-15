return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 1000
	end,

	opts = {
		win = { border = "single" },
		plugins = { spelling = { enabled = true } },
	},

	config = function(_, opts)
		local wkey = require("which-key")
		wkey.setup(opts)

		pcall(function()
			require("core.keymaps").register_whichkey()
		end)
	end,
}
