" curl -fLO $Home/.config/nvim/autoload/plug.vim --create-dirs\
"	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

set nocompatible 	                    " be iMproved, required
filetype off 		                      " required

call plug#begin("~/.config/nvim/plugged")

  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-scripts/Conque-Sell'

call plug#end()

colorscheme gruvbox
map <silent> <C-n> :NERDTreeFocus<CR>

filetype plugin indent on	            "required
set colorcolumn=80
set background=dark
highlight ColorColumn ctermbg=0 guibg=lightgrey
set number
set nowrap
set smartcase
set hlsearch
set noerrorbells
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
