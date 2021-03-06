call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'kshenoy/vim-signature'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'vhdirk/vim-cmake'
Plug 'folke/which-key.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" lsp/language stuff
Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" autocompletion and snippets
Plug 'hrsh7th/nvim-compe'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" colorschemes
Plug 'Th3Whit3Wolf/space-nvim'
Plug 'rafamadriz/neon'
Plug 'tomasiser/vim-code-dark'
Plug 'doums/darcula'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
call plug#end()
