let python_highlight_all=1
syntax on

filetype plugin on
filetype indent on

set fillchars+=vert:\|
set nocompatible
set encoding=utf-8
set hidden
set smartcase
set scrolloff=8
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80

set clipboard+=unnamedplus

augroup CoqtailHighlights
  autocmd!
  autocmd ColorScheme *
    \  hi def CoqtailChecked ctermbg=217 guibg=Grey
    \| hi def CoqtailSent    ctermbg=260 guibg=Grey
augroup END

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
Plug 'cdelledonne/vim-cmake'
Plug 'tpope/vim-surround'

if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'antoinemadec/FixCursorHold.nvim'
endif

Plug 'whonore/Coqtail'

call plug#end()

"set termguicolors
"colorscheme gruvbox

set noshowmode
set laststatus=1
set wildmenu

let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_liststyle=3

let g:ctrlp_use_caching=0
let g:ctrlp_map = '<Leader>,'
nmap <Leader>; :CtrlPBuffer<CR>

let g:airline_powerline_fonts = 0
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1

nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>s :wincmd v<CR>
nnoremap <leader>sh :split<CR>
nnoremap <Leader>rg :Rg<SPACE>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
map <C-P> :bprev<CR>

nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
nmap <leader>cc :CMakeClose<cr>

let g:cmake_default_config = 'build-Release'
let g:cmake_build_options = ['-j6']
