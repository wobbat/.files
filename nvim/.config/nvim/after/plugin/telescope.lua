local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, {})

vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({
        -- Recursive find using the 'find' command
        find_command = { 'fd', '--type', 'f', '--hidden', '--follow' } -- Use 'fd' for recursive and performant search

    })
end, {})
