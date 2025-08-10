-- ALE linting & fixing configuration

return {
	"dense-analysis/ale",

	ft = {
		"python",
		"c",
		"cpp",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"sh",
		"json",
		"lua",
		"html",
		"css",
		"solidity",
	},

	config = function()
		vim.g.ale_linters = {
			python = { "flake8", "mypy" },
			c = { "gcc", "cppcheck", "arduino" },
			cpp = { "g++", "cppcheck", "arduino" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			sh = { "shellcheck" },
			json = { "jq" },
			lua = { "luacheck" },
			html = { "htmllint" },
			css = { "stylelint" },
			solidity = { "solhint" },
			markdown = { "markdownlint" },
		}

		vim.g.ale_fix_on_save = 1

		vim.g.ale_fixers = {
			["*"] = { "remove_trailing_lines", "trim_whitespace" },
			python = { "autopep8" },
			lua = { "stylua" },
			sh = { "shfmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
		}

		vim.g.ale_lint_on_text_changed = "always"
		vim.g.ale_lint_on_save = 1

		vim.g.ale_arduino_executable = "arduino-cli"
		vim.g.ale_arduino_fqbn = "arduino:avr:uno"
	end,
}
