-- TS
-- Custom colors for markdown headers using Treesitter node groups
vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = '#f4bf75', bg = '#7a603b', italic = false })  -- H1
vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = '#b46958', bg = '#5a352c', italic = false })  -- H2
vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = '#90A959', bg = '#48552d', italic = false })  -- H3
vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = '#88afa2', bg = '#445851', italic = false })  -- H4
vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = '#7e97ab', bg = '#3f4c56', italic = false })  -- H5
vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = '#AA749F', bg = '#553a50', italic = false })  -- H6




-- Render Markdown colors
vim.api.nvim_set_hl(0, 'RendermarkdownH1', { fg = '#f4bf75', bg = '#7a603b', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH1BG', { fg = '#f4bf75', bg = '#7a603b', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH2', { fg = '#b46958', bg = '#5a352c', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH2BG', { fg = '#b46958', bg = '#5a352c', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH3', { fg = '#90A959', bg = '#48552d', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH3BG', { fg = '#90A959', bg = '#48552d', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH4', { fg = '#88afa2', bg = '#445851', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH4BG', { fg = '#88afa2', bg = '#445851', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH5', { fg = '#7e97ab', bg = '#3f4c56', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH5BG', { fg = '#7e97ab', bg = '#3f4c56', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH6', { fg = '#AA749F', bg = '#553a50', italic = false })
vim.api.nvim_set_hl(0, 'RendermarkdownH6BG', { fg = '#AA749F', bg = '#553a50', italic = false })
vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = '#727272', bg = '#202020', italic = false })

--vim.api.nvim_set_hl(0, 'markdownH1', { fg = '#c3995e', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownH2', { fg = '#905446', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownH3', { fg = '#cc8446', bg = '', italic = false })
--vim.api.nvim_set_hl(0, 'markdownH4', { fg = '#6d8c82', bg = '', italic = false })
--vim.api.nvim_set_hl(0, 'markdownH5', { fg = '#657989', bg = '', italic = false })
--vim.api.nvim_set_hl(0, 'markdownH6', { fg = '#885d7f', bg = '', italic = false })
vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = '#727272', bg = '', italic = false })
--vim.api.nvim_set_hl(0, 'Normal', { fg = "#b4b4b4", bg = "#151515" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })


--vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', { fg = "#b4b4b4", bg = "#151515" })
--vim.api.nvim_set_hl(0, 'NonText', { fg = "#b4b4b4", bg = "#151515" })
--vim.api.nvim_set_hl(0, 'Whitespace', { fg = "#b4b4b4", bg = "#151515" })
--vim.api.nvim_set_hl(0, 'SpecialKey', { fg = "#00ff00", bg = "#151515" })

-- Set a solid black background for QuickFixLine and NvimBQFQuickfix highlight groups (terminal only)
vim.api.nvim_set_hl(0, 'BqfPreviewFloat', { ctermbg = 'black' })
vim.api.nvim_set_hl(0, 'NvimBQFQuickfix', { ctermbg = 'black' })
