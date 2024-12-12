local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local opts = {};
-- Actually setup the plugins
require("lazy").setup({
    "wobbat/dim.nvim",
    "slugbyte/lackluster.nvim",
    "tpope/vim-markdown",
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = true,
                }
            })
        end,
    },
    'godlygeek/tabular',
    {
        "Mofiqul/adwaita.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            debounce = 100,
            indent = { char = "|" },
            -- whitespace = { highlight = { "Whitespace", "NonText" } },
        }
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                    },
                },
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },

    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "kevinhwang91/nvim-bqf",
        opts = {
            preview = { winblend = 0 },
        },
    },
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'norcalli/nvim-colorizer.lua',
        opts = {},
    },
    -- which key, aint nobody remember all these keybinds
    --    {
    --        "folke/which-key.nvim",
    --        event = "VeryLazy",
    --        init = function()
    --            vim.o.timeout = true
    --           vim.o.timeoutlen = 100
    --       end,
    --        opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    --        }
    --    },
    'nvim-lualine/lualine.nvim',
    -- make lua_ls behave for neovim
    -- otherwise i got errors, i think

    {
        "folke/neodev.nvim",
        opts = {}
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 1,
                width = .65,  -- width of the Zen window
                height = .65, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    -- signcolumn = "no", -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
        }
    },
    -- LSP, just do not touch
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'github/copilot.vim' },
    { 'ellisonleao/gruvbox.nvim' },
    { 'Yazeed1s/minimal.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'ggandor/leap.nvim' },
    { 'hrsh7th/nvim-cmp' },
    --
    -- syntax upgraded
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    -- The one and only telescope
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- comments, whoo
    { 'numToStr/Comment.nvim', opts = {} },
    -- neogit
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },

    --gitsigns
    'lewis6991/gitsigns.nvim',

    -- mostly using this for markdown codeblocks, but adds a buttload of other text object
    {
        "chrisgrieser/nvim-various-textobjs",
        lazy = false,
        --opts = { useDefaultKeymaps = true },
    },

    -- better undo
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = { -- load the plugin only when using it's keybinding:
            { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },
}, opts)
