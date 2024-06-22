return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    require("neoconf").setup({
    })

    local lsp = require('lsp-zero')
    local telescope = require('telescope.builtin')

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {},
      handlers = {
        lsp.default_setup,
      }
    })

    lsp.preset({})

    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Open Diagnostic Float" })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

    lsp.on_attach(function(_, bufnr)

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition", buffer = bufnr })
      vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "Find References", buffer = bufnr })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation", buffer = bufnr })
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })
      vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = "Go to Implementation", buffer = bufnr })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol", buffer = bufnr })
      vim.keymap.set("n", "<leader><leader>d", telescope.diagnostics, { desc = "Telescope Diagnostics", buffer = bufnr })
      vim.keymap.set("n", "<leader><leader>s", telescope.lsp_document_symbols, { desc = "Telescope Document Symbols", buffer = bufnr })
      vim.keymap.set("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, { desc = "Telescope Workspace Symbols", buffer = bufnr })
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc = "Go to Type Definition", buffer = bufnr })
      vim.keymap.set("n", "<space>fo", function() vim.lsp.buf.format { async = true } end, { desc = "Format Document", buffer = bufnr })
    end)

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

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      }
    })
  end
}
