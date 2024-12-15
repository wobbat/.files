local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
--vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, {})

vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({
        -- Recursive find using the 'find' command
        find_command = { 'fd', '--type', 'f', '--hidden', '--follow' } -- Use 'fd' for recursive and performant search

    })
end, {})

vim.keymap.set('n', '<leader>lg', function()
    builtin.live_grep({
        layout_config = { width = { padding = 0 }, height = { padding = 0 }, preview_width = 0.6 }
    })
end, {})

-- Ensure Trouble and Telescope are required
local trouble = require("trouble")
local telescope_trouble = require("trouble.sources.telescope")

-- Bind <C-t> to send the current Telescope search results to Trouble
vim.api.nvim_set_keymap("i", "<C-t>", "<cmd>lua require('trouble.sources.telescope').open()<cr>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua require('trouble.sources.telescope').open()<cr>",
    { noremap = true, silent = true })


vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()

    end,
})




local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')

vim.keymap.set('n', '<leader>tb', function()
    builtin.buffers({
        initial_mode = "normal",
        attach_mappings = function(prompt_bufnr, map)
            local delete_buf = function()
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                current_picker:delete_selection(function(selection)
                    vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                end)
            end

            map('n', '<c-d>', delete_buf)

            return true
        end
    }, {
        sort_lastused = true,
        sort_mru = true,
        theme = "dropdown"
    })
end)


require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')


--  Multigrep!!
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values

local live_multigrep = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local finder = finders.new_async_job {
        command_generator = function(prompt)
            if not prompt or prompt == "" then
                return nil
            end

            local pieces = vim.split(prompt, "  ")
            local args = { "rg" }
            if pieces[1] then
                table.insert(args, "-e")
                table.insert(args, pieces[1])
            end
            if pieces[2] then
                table.insert(args, "-g")
                table.insert(args, pieces[2])
            end
            return vim.iter({
                    args,
                    { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" } })
                :flatten():totable()
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    }
    pickers.new(opts, {
        debounce = 100,
        prompt_title = "Multi Grep",
        previewer = conf.grep_previewer(opts),
        sorter = require "telescope.sorters".empty(),
        finder = finder,
    }):find()
end

vim.keymap.set("n", "<leader>mg",
    function()
        live_multigrep({ layout_config = { width = { padding = 0 }, height = { padding = 0 }, preview_width = 0.6 } })
    end
)
