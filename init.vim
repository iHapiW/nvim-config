" curl -fLO $Home/.config/nvim/autoload/plug.vim --create-dirs\
"	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

source $HOME/.config/nvim/plug-config/coc.vim
set nocompatible 	                    " be iMproved, required
"filetype off 		                      " required
set fileformat=unix
syntax enable

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

set background=dark
set encoding=utf-8
set scrolloff=7
set backspace=indent,eol,start

set splitright
set splitbelow

let mapleader=' '

call plug#begin("~/.config/nvim/plugged")

  Plug 'dracula/vim'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdcommenter'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'sirver/ultisnips'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-airline/vim-airline'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


colorscheme dracula
if (has("termguicolors"))
  set termguicolors
endif

lua require 'colorizer'.setup()

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NERDTree
"let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
"nmap <C-n> :NERDTreeToggle<CR>
map <silent> <C-n> :NERDTreeFocus<CR>

" Tabs
let g:airline#extenstions#tabline#enabled=1
let g:airline#extenstions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-d> :bd<CR>

" Ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

filetype plugin indent on	            "required
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set number relativenumber
set nowrap
set smartcase
set hlsearch
set noerrorbells
