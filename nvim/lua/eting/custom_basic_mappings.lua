local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Page up and down, centering vertically each time.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { remap = false })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { remap = false })

-- Delete and paste without changing register content.
vim.keymap.set("v", "<leader>p", '"_dP', { remap = false })
vim.keymap.set("v", "<leader>d", '"_d', { remap = false })

-- Paste on next line
vim.keymap.set("n", "<leader>pu", ":pu<CR>", { remap = false })

-- Yank without changing register content.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { remap = false })
vim.keymap.set("n", "<leader>Y", [["+Y]], { remap = false })

-- Copy [f]ull path.
vim.keymap.set("n", "<leader>mf", ":let @+=expand('%:p')<CR>", opts)
-- Copy [r]elative path.
vim.keymap.set("n", "<leader>mr", ":let @+=fnamemodify(expand('%'), ':~:.')<CR>", opts)
-- [f]ile [u]rl
vim.keymap.set("n", "<leader>fu", ":let @+=v:lua.require('eting.utils.github_link').get_github_url()<CR>", opts)
-- [l]ine [u]rl
vim.keymap.set("n", "<leader>lu", ":let @+=v:lua.require('eting.utils.github_link').get_github_url_line()<CR>", opts)
-- [f]ile [o]pen
vim.keymap.set("n", "fo", require("eting.utils.github_link").open_github_url, opts)
-- [l]ine [o]pen
vim.keymap.set("n", "lo", require("eting.utils.github_link").open_github_url_line, opts)

-- Custom gx to open URLs.
vim.keymap.set("x", "gx", require("eting.utils.link").open_url_under_cursor, opts)
vim.keymap.set("n", "gx", require("eting.utils.link").open_url_under_cursor, opts)
