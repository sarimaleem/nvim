-- Only required if you have packer configured as `opt` vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- color schemes
    use "sainnhe/gruvbox-material"
    use "sainnhe/edge"
    use "sainnhe/sonokai"
    use "sainnhe/everforest"
    use "rebelot/kanagawa.nvim"
    use "cpea2506/one_monokai.nvim"


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
    }

    -- The LSP stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use { "jose-elias-alvarez/null-ls.nvim" }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-sleuth"
    use "nvim-lualine/lualine.nvim"
    use "numToStr/Comment.nvim"
    use "mbbill/undotree"
    use "vimwiki/vimwiki"
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use "michal-h21/vimwiki-sync"
    use "simrat39/symbols-outline.nvim"

    -- Debugging
    use {
        "mfussenegger/nvim-dap",
        opt = true,
        event = "BufReadPre",
        module = { "dap" },
        wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
        requires = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-telescope/telescope-dap.nvim",
            "rcarriga/cmp-dap"
        },
        config = function()
            require("config.dap").setup()
        end,
    }

    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
    use "folke/flash.nvim"
    use "Vigemus/iron.nvim"
end)
