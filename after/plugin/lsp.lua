local lsp = require('lsp-zero')
local telescope = require('telescope.builtin')

lsp.preset({})

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'clangd',
  'pyright',
})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", telescope.lsp_references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename symbol" })
  vim.keymap.set("n", "<leader><leader>d", telescope.diagnostics, { desc = "Telescope Diagnostics" })
  vim.keymap.set("n", "<leader><leader>s", telescope.lsp_document_symbols, { desc = "Telescope Document Symbols" })
  vim.keymap.set("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, { desc = "Telescope Workspace Symbols" })
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>fo", function() vim.lsp.buf.format { async = true } end, opts)
end)

lsp.nvim_workspace()

lsp.setup()


-- Prettier Diagnostic Icons
local function lspSymbol(name, icon)
  vim.fn.sign_define('DiagnosticSign' .. name,
    { text = icon, numhl = 'DiagnosticSign' .. name, texthl = "DiagnosticSign" .. name })
end

lspSymbol('Error', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warn', '')
