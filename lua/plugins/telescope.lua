return {
  'nvim-telescope/telescope.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local telescope = require('telescope')
    telescope.setup {}
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>fi', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "List buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help" })
  end
}
