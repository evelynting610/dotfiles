return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-smart-history.nvim",
		"smartpde/telescope-recent-files",
	},
	config = function()
		local telescope = require("telescope")

		telescope.load_extension("recent_files")
		telescope.load_extension("smart_history")

		local actions = require("telescope.actions")
		local lga_actions = require("telescope-live-grep-args.actions")

		local custom_actions = require("eting.utils.telescope_actions")

		-- Grep
		vim.keymap.set("n", "<leader>fg", custom_actions.live_grep_args, {})
		vim.keymap.set("n", "<leader>fp", custom_actions.live_grep_python, {})
		vim.keymap.set("n", "<leader>fj", custom_actions.live_grep_js, {})
		vim.keymap.set("n", "<leader>fd", custom_actions.live_grep_args_in_search_dir, {})

		-- Grep word under cursor
		vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, {})

		-- Find files
		vim.keymap.set("n", "<leader>ff", custom_actions.find_files, {})
		vim.keymap.set("n", "<leader>ffd", custom_actions.find_files_in_search_dir, {})

		-- [F]ind [L]ast (Resume previous)
		vim.keymap.set("n", "<leader>fl", require("telescope.builtin").resume, {})

		-- Find buffers
		vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})

		-- Find help
		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})

		-- Find recent
		vim.keymap.set(
			"n",
			"<leader><leader>",
			[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
			{ noremap = true, silent = true }
		)
		telescope.setup({
			defaults = {
				history = {
					path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
					limit = 100,
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
				-- Use a .ignore file in the project root instead.
				-- file_ignore_patterns = {},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				live_grep_args = {
					path_display = { "shorten" },
					auto_quoting = true,
					mappings = {
						i = {
							["<C-s>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
