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

opts = {}
-- moving around stuff
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- Set space as the leader key
vim.g.mapleader = ' '  -- space bar

-- Now <Leader>h and <Leader>l will work as desired
vim.api.nvim_set_keymap('n', '<Leader>hh', ':normal! <C-o><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ll', ':normal! <C-i><CR>', { noremap = true, silent = true })


vim.keymap.set("n", "<leader>mts", function()
    MiniTrailspace.trim()
end)

function toggle_checkbox()
  -- Get the current line
  local line = vim.api.nvim_get_current_line()

  -- Check for "[ ]" and replace it with "[-]"
  if line:find("%[ %]") then
    line = line:gsub("%[ %]", "[-]", 1)
  -- Check for "[-]" and replace it with "[x]"
  elseif line:find("%[%-%]") then
    line = line:gsub("%[%-%]", "[x]", 1)
  -- Check for "[x]" and replace it with "[ ]"
  elseif line:find("%[x%]") then
    line = line:gsub("%[x%]", "[ ]", 1)
  else
    -- If none are found, insert "[ ]" at the beginning of the line
    line = "- [ ] " .. line
  end

  -- Set the updated line back
  vim.api.nvim_set_current_line(line)
end

-- Bind the function to a key (optional)
vim.api.nvim_set_keymap("n", "<leader>cb", ":lua toggle_checkbox()<CR>", { noremap = true, silent = true })
