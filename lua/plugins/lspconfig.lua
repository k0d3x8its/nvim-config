-- LSP server configuration
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- for autocompletion capabilities
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- file ops for LSP
		"b0o/SchemaStore.nvim", -- YAML/JSON schemas
	},

	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import cmp-nvim-lsp plugin for enhanced completion capabilities
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- keymap options
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- filetypes where LSP should not format (ALE/Prettier will handle this)
		local lsp_format_blocklist = { yaml = true, yml = true }

		-- on_attach function for keymaps and formatting
		local on_attach = function(client, bufnr)
			local nmap = function(keys, fn, desc)
				vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc and "LSP: " .. desc })
			end

			-- keymaps
			nmap("gd", vim.lsp.buf.definition, "Go to Definition")
			nmap("K", vim.lsp.buf.hover, "Hover Docs")
			nmap("gi", vim.lsp.buf.implementation, "Go to Implementation")
			nmap("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
			nmap("gr", vim.lsp.buf.references, "Find References")
			nmap("<leader>ld", vim.diagnostic.open_float, "Line Diagnostic")

			-- format on save (skip filetypes handled by ALE)
			local ft = vim.bo[bufnr].filetype
			if
				not lsp_format_blocklist[ft]
				and client.server_capabilities
				and client.server_capabilities.documentFormattingProvider
			then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end

		vim.diagnostic.config({
			virtual_text = true, -- show inline error text
			underline = true, -- underline errors in the buffer
			signs = {
				-- define one gutter icon per severity
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = " ",
				},
				-- optionally tweak the highlight groups (uses built-in groups by default)
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				},
			},
		})

		-- list all servers you installed via Mason (basic setup only)
		for _, server in ipairs({
			"html",
			"cssls",
			"ts_ls",
			"solidity_ls",
			"pyright",
			"clangd",
			"arduino_language_server",
			"bashls",
			"jsonls",
			"yamlls",
		}) do
			if server ~= "yamlls" then
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end

		-- configure lua_ls server (with diagnostics fix for `vim`)
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }, -- fixes: undefined global `vim`
					},
				},
			},
		})

		-- YAML language server (disable LSP formatting; ALE/Prettier does it):
		local ok_schema, schemastore = pcall(require, "schemastore")
		lspconfig.yamlls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				yaml = {
					validate = true,
					format = { enable = false }, -- IMPORTANT: avoid double-formatting
					keyOrdering = false,
					schemaStore = { enable = false, url = "" }, -- use SchemaStore.nvim’s local index
					schemas = ok_schema and schemastore.yaml.schemas()
						or {
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.{yml,yaml}",
							["https://json.schemastore.org/github-action.json"] = "/.github/actions/*.{yml,yaml}",
							["https://json.schemastore.org/kubernetes.json"] = "/*.k8s.{yml,yaml}",
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.{yml,yaml}",
						},
				},
			},
		})
	end,
}
