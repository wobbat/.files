-- in your plugins.lua (or wherever you call require('lazy').setup)
return {
  {
    'phaazon/hop.nvim',
    branch = 'v2',  -- use the latest v2 release
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {},      -- no special opts needed here
    config = function()
      require('hop').setup({})

      -- your keymaps:
      vim.keymap.set('n', '<leader>/', '<cmd>HopPattern<CR>', { noremap = true, silent = true, desc = 'Hop: pattern' })
      vim.keymap.set('n', 's',         '<cmd>HopChar1<CR>',  { noremap = true, silent = true, desc = 'Hop: char1' })
      vim.keymap.set('n', '<leader>hc', '<cmd>HopChar2<CR>', { noremap = true, silent = true, desc = 'Hop: char2' })
    end,
  },
}

