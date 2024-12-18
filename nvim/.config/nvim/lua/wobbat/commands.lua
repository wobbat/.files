local command = vim.api.nvim_create_user_command

-- Trim trailing whitespace and trailing blank lines on save
local function daily_note()
    local date = os.date('%d-%m-%Y')
    vim.cmd.edit("~/_/log/daily/" .. date .. ".md")
end

command('DailyNote', daily_note, {})

-- Trim trailing whitespace and trailing blank lines on save
local function insert_time()
    local date = os.date('%H:%M')
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('i' .. date .. ' - <esc>a', true, false, true), 'm', true)
end

command('InsertTime', insert_time, {})


vim.api.nvim_create_user_command("VQF", function()
    vim.cmd("vertical copen")
    vim.cmd("vertical resize 50")
end, {})

vim.api.nvim_create_user_command("ReloadConfig", function()
    vim.cmd("source " .. vim.fn.expand("$MYVIMRC"))
end, {})



-- Function to open a floating terminal in the center of the screen
local function open_floating_terminal()
    -- Get the dimensions of the editor
    local ui = vim.api.nvim_list_uis()[1]
    local width = math.floor(ui.width * 0.8)
    local height = math.floor(ui.height * 0.8)
    local col = math.floor((ui.width - width) / 2)
    local row = math.floor((ui.height - height) / 2)

    -- Create the floating window with a terminal buffer
    local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'rounded',
    })

    -- Set the buffer to terminal mode
    vim.fn.termopen(vim.o.shell) -- Open the terminal using the default shell
    vim.api.nvim_command('startinsert') -- Start in insert mode

    -- Optionally set the window to close with <q>
    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end

-- Call the function
vim.api.nvim_create_user_command("FloatTerm", function()
    open_floating_terminal()
end, {})
