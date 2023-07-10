vim.g.mapleader = " "

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "auto"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.clipboard = "unnamedplus"

vim.o.ignorecase = true
vim.o.smartcase = true

-- some remaps
vim.api.nvim_set_keymap("n", "H", "^", { desc = "goto beginning of line" })
vim.api.nvim_set_keymap("v", "H", "^", { desc = "goto beginning of line" })
vim.api.nvim_set_keymap("n", "L", "$", { desc = "goto end of line" })
vim.api.nvim_set_keymap("v", "L", "$", { desc = "goto end of line" })
vim.api.nvim_set_keymap("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "search and replace word" })
vim.api.nvim_set_keymap("x", "<leader>p", [["_dP]], { desc = "paste without replacing register" })
vim.api.nvim_set_keymap("n", "<F9>", ":so ~/.config/nvim/init.lua<CR>", { desc = "source config" })
