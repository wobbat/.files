require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
}

-- Set signcolumn to auto after opening a window
vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
        vim.wo.signcolumn = 'auto' -- Set signcolumn to 'auto'
    end,
})
