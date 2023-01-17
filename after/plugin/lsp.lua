local lsp = require('lsp-zero')
local telescope = require('telescope.builtin')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer'
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {desc = "rename symbol"})
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gr", telescope.lsp_references, opts)
  vim.keymap.set("n", "<leader>di", telescope.diagnostics, {desc = "Telescope Diagnostics"})
  vim.keymap.set("n", "<leader>ds", telescope.lsp_document_symbols, {desc = "Telescope Document Symbols"})
  vim.keymap.set("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, {desc = "Telescope Workspace Symbols"})
end)

lsp.nvim_workspace()

lsp.setup()
