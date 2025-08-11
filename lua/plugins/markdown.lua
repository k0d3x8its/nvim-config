return {
	"tadmccorkle/markdown.nvim",
	ft = "markdown",

	config = function()
		local markdown = require("markdown")

		markdown.setup()
	end,
}
