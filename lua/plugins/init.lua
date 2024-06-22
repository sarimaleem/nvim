return {
  "folke/which-key.nvim",
  { "folke/neoconf.nvim",    cmd = "Neoconf" },
  -- color schemes
  'sainnhe/gruvbox-material',
  'sainnhe/edge',
  'sainnhe/sonokai',
  'sainnhe/everforest',
  'rebelot/kanagawa.nvim',
  'cpea2506/one_monokai.nvim',

  -- LSP
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/playground',

  -- Formatting and linting
  'jose-elias-alvarez/null-ls.nvim',

  -- Utility plugins
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-sleuth',
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup()
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    lazy = false,
  },
  'vimwiki/vimwiki',
  'michal-h21/vimwiki-sync',
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      local symbols_outline = require("symbols-outline")

      vim.keymap.set("n", "<leader>so", ":SymbolsOutline<cr>", { desc = "Symbols outline Toggle" })
      symbols_outline.setup()
    end
  },
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  'Vigemus/iron.nvim',
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require('nvim-autopairs')

      -- change default fast_wrap
      npairs.setup({
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = [=[[%'%"%)%>%]%)%}%,]]=],
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey = 'Comment'
        }
      })
    end
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }
}
