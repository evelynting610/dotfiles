return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
		})

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(_, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end
			local function buf_set_option(...)
				vim.api.nvim_buf_set_option(bufnr, ...)
			end

			--Enable completion triggered by <c-x><c-o>
			buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Mappings.
			local opts = { noremap = true, silent = true }

			-- See `:help vim.lsp.*` for documentation on any of the below functions
			buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
			buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
			buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
			buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		end

		require("lspconfig").pyright.setup({
			on_attach = on_attach,
			filetypes = { "python" },
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- Configure `ruff-lsp`.
		-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
		-- For the default config, along with instructions on how to customize the settings
		require("lspconfig").ruff_lsp.setup({
			on_attach = on_attach,
			filetypes = { "python" },
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			filetypes = { "lua" },
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
}
