return {
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options           = {
                icons_enabled        = false,
                theme                = 'auto',
                component_separators = { left = ' ', right = ' ' },
                section_separators   = { left = ' ', right = ' ' },
                disabled_filetypes   = {
                    statusline = {},
                    winbar     = {},
                },
                ignore_focus         = {},
                always_divide_middle = true,
                globalstatus         = false,
                refresh              = {
                    statusline = 1000,
                    tabline    = 1000,
                    winbar     = 1000,
                },
            },
            sections          = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch',
                    {
                        'diagnostics',
                        cond = function()
                            return _G.diagnostics_visible
                        end,
                    },
                },
                lualine_c = { 'filename' },
                lualine_x = { '' },
                lualine_y = { 'diff', 'filetype' },
                lualine_z = { 'filename' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline           = {},
            winbar            = {},
            inactive_winbar   = {},
            extensions        = {},
        },
    },
}
