" Plugins
call plug#begin()
    Plug 'folke/tokyonight.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-context'

    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'

    Plug 'stevearc/oil.nvim'

    Plug 'stevearc/conform.nvim',
    Plug 'williamboman/mason.nvim',
    Plug 'williamboman/mason-lspconfig.nvim',
    Plug 'hrsh7th/cmp-nvim-lsp',
    Plug 'hrsh7th/cmp-buffer',
    Plug 'hrsh7th/cmp-path',
    Plug 'hrsh7th/cmp-cmdline',
    Plug 'hrsh7th/nvim-cmp',
    Plug 'L3MON4D3/LuaSnip',
    Plug 'saadparwaiz1/cmp_luasnip',
    Plug 'j-hui/fidget.nvim',
    Plug 'neovim/nvim-lspconfig',

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Everything else...
lua require("theprimeagen")

" Specific stuff
" let g:airline_powerline_fonts = 0
let g:airline_theme='lucius'
let g:airline#extensions#tabline#enabled = 1
