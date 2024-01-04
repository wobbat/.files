vim.g.mapleader = " "
-- File manager
vim.keymap.set("n", "<leader>fb", vim.cmd.Ex)
-- Better redo
vim.keymap.set("n", "U", "<C-r>")
-- open diagnostics?
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>DailyNote<CR>', { noremap = true, silent = true })
