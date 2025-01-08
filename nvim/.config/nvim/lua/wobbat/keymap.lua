vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "_")
--vim.keymap.set("n", "J", "<C-d>zz")
--vim.keymap.set("n", "K", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>ftb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
-- Better redo
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "U", "<C-r>")

-- LEADER stuff
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fb", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>DailyNote<CR>', { noremap = true, silent = true })

-- Show quick fix
vim.api.nvim_set_keymap('n', '<Leader>qf', ':copen<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tt", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    vim.cmd.startinsert() -- Start insert mode in the terminal
end)

vim.api.nvim_set_keymap('n', '<leader>hl', '<cmd>HopLine<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hw', '<cmd>HopWord<CR>', { noremap = true, silent = true })


-- windows movement?
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })



-- Remap Tab to Escape in Visual mode
vim.api.nvim_set_keymap('v', '<Tab>', '<Esc>', { noremap = true, silent = true })

-- Remap Tab to Escape in Insert mode
vim.api.nvim_set_keymap('i', '<Tab>', '<Esc>', { noremap = true, silent = true })

