return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"RRethy/nvim-treesitter-endwise",
		"andymass/vim-matchup",
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"lua",
				"markdown",
				"markdown_inline",
				"java",
				"javascript",
				"python",
			},
			endwise = {
				enable = true,
			},
			matchup = {
				enable = true,
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "python" },
			},
		})
	end,
}
