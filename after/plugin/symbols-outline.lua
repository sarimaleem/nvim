local symbols_outline = require("symbols-outline")

vim.keymap.set("n", "<leader>so", ":SymbolsOutline<cr>", {desc = "Symbols outline Toggle"})
symbols_outline.setup()
