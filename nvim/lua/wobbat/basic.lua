-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
-- Formatting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
--Fix markdown fenced code blocks
vim.cmd("let g:markdown_fenced_languages = ['html', 'php','python', 'javascript', 'js=javascript']")
-- theme
vim.cmd("colorscheme no-clown-fiesta")
vim.opt.clipboard = "unnamedplus"

vim.cmd("set signcolumn=no")

vim.opt.spelllang = 'en_us,nl'
vim.opt.spell = true
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ab8550' })

--markdown test?
--
vim.api.nvim_set_hl(0, 'markdownH1', { fg = '#f4bf75', bg = '#7a603b', italic = false })
vim.api.nvim_set_hl(0, 'markdownH2', { fg = '#b46958', bg = '#5a352c', italic = false })
vim.api.nvim_set_hl(0, 'markdownH3', { fg = '#90A959', bg = '#48552d', italic = false })
vim.api.nvim_set_hl(0, 'markdownH4', { fg = '#88afa2', bg = '#445851', italic = false })
vim.api.nvim_set_hl(0, 'markdownH5', { fg = '#7e97ab', bg = '#3f4c56', italic = false })
vim.api.nvim_set_hl(0, 'markdownH6', { fg = '#AA749F', bg = '#553a50', italic = false })
vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = '#727272', bg = '#202020', italic = false })

vim.api.nvim_set_hl(0, 'markdownH1', { fg = '#c3995e', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownH2', { fg = '#905446', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownH3', { fg = '#738747', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownH4', { fg = '#6d8c82', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownH5', { fg = '#657989', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownH6', { fg = '#885d7f', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = '#727272', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'Normal', { fg = "#b4b4b4", bg = "#151515" })
