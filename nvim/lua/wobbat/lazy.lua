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

-- Actually setup the plugins
require("lazy").setup({
    "aktersnurra/no-clown-fiesta.nvim",
    "andrewferrier/wrapping.nvim",
    "tpope/vim-markdown",
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },
    -- which key, aint nobody remember all these keybinds
    { 'folke/which-key.nvim',             opts = {} },
    'nvim-lualine/lualine.nvim',
    -- make lua_ls behave for neovim
    -- otherwise i got errors, i think
    { "folke/neodev.nvim",                opts = {} },
    -- LSP
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'github/copilot.vim' },
    { 'ellisonleao/gruvbox.nvim' },
    { 'Yazeed1s/minimal.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    -- { 'L3MON4D3/LuaSnip' },

    -- Gotta use treesitter, syntax upgraded
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    -- The one and only telescope
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
        opts = { useDefaultKeymaps = true },
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
