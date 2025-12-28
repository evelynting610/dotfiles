return {
	"lukas-reineke/indent-blankline.nvim", -- Indent guides for Neovim
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	config = function()
		require("ibl").setup({
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"lazy",
					"mason",
				},
			},
		})
	end,
}
