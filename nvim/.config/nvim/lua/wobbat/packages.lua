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
    "tpope/vim-markdown",
    "slugbyte/lackluster.nvim",
    { 'echasnovski/mini.nvim', version = false },
   {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    },
    {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup()
  end,
},
    {
        'saghen/blink.cmp',
        lazy = false, -- lazy loading handled internally
        -- optional: provides snippets for the snippet source
        dependencies = 'rafamadriz/friendly-snippets',

        -- use a release tag to download pre-built binaries
        version = 'v0.*',
               ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- see the "default configuration" section below for full documentation on how to define
            -- your own keymap.
            keymap = { preset = 'default' },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- will be removed in a future release
                use_nvim_cmp_as_default = false,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- experimental signature help support
            signature = { enabled = true }
        },
        -- allows extending the providers array elsewhere in your config
        -- without having to redefine it
        opts_extend = { "sources.default" }
    },
    {
    "atiladefreitas/dooing",
    config = function()
        require("dooing").setup({
            -- your custom config here (optional)
        })
    end,
},
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,
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
    "folke/trouble.nvim",
    --    {
    --        "kevinhwang91/nvim-bqf",
    --       opts = {
    --           preview = { winblend = 0 },
    --       },
    --   },
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
        dependencies = { "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim" }
    },
    {
        'norcalli/nvim-colorizer.lua',
        opts = {},
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 100
        end,
        opts = {
        }
    },
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
                height = .99, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                options = {
                    signcolumn = "yes", -- disable signcolumn
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
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
              -- passing config.capabilities to blink.cmp merges with the capabilities in your
              -- `opts[server].capabilities, if you've defined it
              config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
              lspconfig[server].setup(config)
            end
          end,

        -- example using `opts` for defining servers
        opts = {
            servers = {
                lua_ls = {},
                gopls = {}
            }
        }
    },
    { 'github/copilot.vim' },
    { 'ellisonleao/gruvbox.nvim' },
    { 'Yazeed1s/minimal.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'ggandor/leap.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = [[cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release
        and cmake --build build --config Release]]
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'numToStr/Comment.nvim', opts = {} },
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
    'lewis6991/gitsigns.nvim',
    -- mostly using this for markdown codeblocks,
    -- but adds a buttload of other text object
    {
        "chrisgrieser/nvim-various-textobjs",
        lazy = false,
    },
    {
        "m4xshen/smartcolumn.nvim",
        opts = {}
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
