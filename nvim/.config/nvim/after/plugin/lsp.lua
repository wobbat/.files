require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'bashls', 'gopls', 'lua_ls', 'rust_analyzer' },
    handlers = {

      on_attach = on_attach,  -- Apply the global on_attach function
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                single_file_support = false,
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,

                },
            })
        end,
    }
})

-- Define the 'on_attach' function
local function on_attach(client, bufnr)
  -- Set up keybindings for LSP features
  enable_format_on_save(client, bufnr)
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- You can add more LSP-related setup here as needed
end

-- Function to enable format on save
local function enable_format_on_save(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

--local cmp = require('cmp')
--local cmp_select = { behavior = cmp.SelectBehavior.Select }
--local cmp_mappings = lsp.defaults.cmp_mappings({
--    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--    ["<C-Space>"] = cmp.mapping.complete(),
--})

-- uncomment to get warning and see how to change default behavior
--lsp.setup_nvim_cmp({
--  mapping = cmp_mappings
--})

--lsp.set_preferences({
--    suggest_lsp_servers = false,
--    sign_icons = {
--        error = 'E',
--       warn = 'W',
--        hint = 'H',
--        info = 'I'
--    }
--:w
--})

--lsp.on_attach(function(client, bufnr)
--    local opts = { buffer = bufnr, remap = false }
--
--    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
-- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--
--   lsp.buffer_autoformat()
--end)

--lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
