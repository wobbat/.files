-- after/lspconfig.lua
local lspconfig = require('lspconfig')

-- Function to enable format-on-save
local function enable_format_on_save(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

-- Common on_attach function
local function on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
    -- Add any other keymaps or custom logic here
end

-- Configure LSP servers
local servers = {
    lua_ls = {
        settings = {
            Lua = {
                format = { enable = true },
            },
        },
    },
    gopls = {
        settings = {
            gopls = {
                gofumpt = true, -- Optional: Use gofumpt for stricter formatting
                staticcheck = true,
                analyses = { unusedparams = true },
            },
        },
    },
}

-- Setup each server
for server, config in pairs(servers) do
    -- Include blink.cmp capabilities if applicable
    if require('blink.cmp') then
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
    end
    -- Inject the on_attach callback and set up the server
    config.on_attach = on_attach
    lspconfig[server].setup(config)
end

