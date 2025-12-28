return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/lazydev.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.diagnostic.config({
			underline = true,
		})

		-- Set up keymaps when LSP attaches to a buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local opts = { buffer = bufnr, noremap = true, silent = true }

				-- Enable completion triggered by <c-x><c-o>
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Diagnostic keymaps
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1 }) end, opts)
				vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1 }) end, opts)
				vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

				-- LSP keymaps
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			end,
		})

		-- Get capabilities from cmp-nvim-lsp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Configure pyright
		vim.lsp.config("pyright", {
			filetypes = { "python" },
			capabilities = capabilities,
		})

		-- Configure lua_ls
		vim.lsp.config("lua_ls", {
			filetypes = { "lua" },
			capabilities = capabilities,
			root_markers = { ".luarc.json", ".luarc.jsonc", ".stylua.toml", "stylua.toml", ".git" },
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

		-- Enable the language servers
		vim.lsp.enable({ "pyright", "lua_ls" })
	end,
}
