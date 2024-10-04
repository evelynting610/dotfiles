return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
		"andymass/vim-matchup",
		"JoosepAlviste/nvim-ts-context-commentstring",
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
				"html",
				"sql",
				"json",
				"dockerfile",
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
				disable = { "python", "html" },
			},
		})
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
