local lsp = require('lsp-zero')
local telescope = require('telescope.builtin')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
  'clangd',
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename symbol" })
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gr", telescope.lsp_references, opts)
  -- vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {desc = "go to implementation"})
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
  vim.keymap.set("n", "<leader><leader>d", telescope.diagnostics, { desc = "Telescope Diagnostics" })
  vim.keymap.set("n", "<leader><leader>s", telescope.lsp_document_symbols, { desc = "Telescope Document Symbols" })
  vim.keymap.set("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, { desc = "Telescope Workspace Symbols" })
  vim.keymap.set('n', '<space>fo', function() vim.lsp.buf.format { async = true } end, opts)
end)

lsp.nvim_workspace()

lsp.setup()


-- Prettier Diagnostic Icons
local function lspSymbol(name, icon)
  vim.fn.sign_define('DiagnosticSign' .. name, {text = icon, numhl = 'DiagnosticDefault' .. name, texthl = "DiagnosticSign" .. name})
end

lspSymbol('Error', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warn', '')
