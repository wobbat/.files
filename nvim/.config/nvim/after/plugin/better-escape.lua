-- lua, default settings
require("better_escape").setup {
    timeout = vim.o.timeoutlen,
    default_mappings = true,
    mappings = {
        i = {
            k = {
                -- These can all also be functions
                j = "<Esc>",
            },
        },
        c = {
            k = {
                j = "<Esc>",
            },
        },
        t = {
            k = {
                j = "<C-\\><C-n>",
            },
        },
        v = {
            k = {
                j = "<Esc>",
            },
        },
        s = {
            k = {
                j = "<Esc>",
            },
        },
    },
}
