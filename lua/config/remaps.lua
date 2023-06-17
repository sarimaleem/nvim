vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFileToggle)
vim.keymap.set("n", "<leader>t", vim.cmd.FloatermToggle)
vim.api.nvim_set_keymap('t', '<C-t>', '<C-\\><C-n>:FloatermToggle<CR>', {noremap = true, silent = true})




