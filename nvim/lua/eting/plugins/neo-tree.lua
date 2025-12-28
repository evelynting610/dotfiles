return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set("n", "<leader>tr", "<cmd>Neotree toggle<cr>")
		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = false,
			enable_diagnostics = false,
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "disabled",
				use_libuv_file_watcher = true,
			},
			window = {
				auto_expand_width = true,
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function(_file_path)
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
	end,
}
