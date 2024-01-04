local command = vim.api.nvim_create_user_command

-- Trim trailing whitespace and trailing blank lines on save
local function daily_note()
    os.date('%Y-%m-%d %H:%M:%S')
    local date = os.date('%d-%m-%Y')
    vim.cmd.edit("~/_/log/daily/" .. date .. ".md")
end

command('DailyNote', daily_note, {})
