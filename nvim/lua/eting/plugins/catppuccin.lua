return {
	"catppuccin/nvim",
	config = function()
		require("catppuccin").setup({
			flavour = "latte", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {
				latte = {
					base = "#f0e3f0",
					pink = "#BD5FA3",
					mauve = "#660066",
					teal = "#148389",
					lavender = "#9933ff",
					yellow = "#A06514",
					green = "#008000",
					blue = "#005ce6",
					peach = "#E45A09",
					text = "#575279",
					subtext1 = "#2d2018",
					subtext0 = "#9893a5",
					rosewater = "#d7827e",
					flamingo = "#d8707e",
					mantle = "#facff2",
					crust = "#2D2018",
				},
			},
			highlight_overrides = {
				all = function(colors)
					return {
						NvimTreeNormal = { fg = colors.none },
					}
				end,
				latte = function(_)
					return {
						Comment = { fg = "#BD5FA3" },
						LineNr = { fg = "#2D2018" },
					}
				end,
			},
			integrations = {
				alpha = false,
				cmp = true,
				dashboard = false,
				flash = false,
				gitsigns = false,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				nvimtree = false,
				neotree = false,
				treesitter = true,
				notify = false,
				mini = {
					enabled = false,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
			compile = {
				enabled = true,
				path = vim.fn.stdpath("cache") .. "/catppuccin",
			},
		})
		vim.cmd([[colorscheme catppuccin]])
	end,
}
