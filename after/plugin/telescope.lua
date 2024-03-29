local telescope = require('telescope')

telescope.setup {}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fi', builtin.find_files, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
