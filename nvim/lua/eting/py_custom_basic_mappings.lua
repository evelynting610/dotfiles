local opts = { noremap = true, silent = true }

-- Copy [m]odule
vim.keymap.set("n", "<leader>mm", ":let @+=fnamemodify(expand('%'), ':~:.:gs?/?.?:r')<CR>", opts)
