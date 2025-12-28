return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				htmldjango = { "djlint" },
				lua = { "stylua" },
				python = { "isort", "ruff_format" },
				html = { "djlint" },
				javascript = { "prettierd" },
				json = { "prettierd" },
				markdown = {
					"prettierd",
					"markdown-toc",
					"markdownlint",
				},
				-- css = { { "prettierd", "prettier" } },
			},
			format_on_save = { timeout_ms = 5000, lsp_fallback = true },
		})

		vim.keymap.set({ "n", "v" }, "<leader>c", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
