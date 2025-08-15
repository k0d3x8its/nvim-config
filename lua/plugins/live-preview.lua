return {
	"brianhuster/live-preview.nvim",
	ft = { "markdown", "asciidoc", "html", "svg" },
	dependencies = { "nvim-telescope/telescope.nvim" },
	cmd = { "LivePreview" },

	config = function()
		local preview = require("livepreview.config")

		preview.set({})

		vim.o.autowriteall = true

		local aug = vim.api.nvim_create_augroup("LivePreviewHTMLAutosave", { clear = true })
		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
			group = aug,
			pattern = "*.html",
			callback = function(args)
				if vim.api.nvim_buf_is_valid(args.buf) and vim.bo[args.buf].modified then
					vim.cmd([[silent! update]])
				end
			end,
			desc = "Auto-save HTML so live-preview refreshes",
		})
	end,
}
