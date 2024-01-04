require("no-clown-fiesta").setup({
    transparent = false, -- Enable this to disable the bg color
    styles = {
        -- You can set any of the style values specified for `:h nvim_set_hl`
        comments = {},
        htmlH2 = { fg = "#00FF00", underline = true },
        keywords = {},
        functions = {},
        variables = {},
        type = { bold = true },
        lsp = { underline = true }
    },
})
