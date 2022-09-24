" Vim-Plug Installation:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

filetype plugin indent on
set fileformat=unix
syntax on
set encoding=UTF-8

" Options set background=dark
set clipboard=unnamedplus                   " Enables Clipboard Sharing 
set completeopt=noinsert,menuone,preview   " Modifies auto-complete menu to behave like IDE
set cursorline                              " Highlights current line set hidden                                  " Hide unused buffers set inccommand=split                        " Show replacement in a split screen befire apply to file set number
set number
set splitbelow splitright
set title
set ttimeoutlen=0                           " Time in milisconds to run commands
set scrolloff=10
set smartcase
set nowrap
let mapleader=' ' " Tab Size
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" Color Support
set t_Co=256                                 " Enables 256 colors on Terminal
let term_program=$TERM_PROGRAM               " True color if available
if term_program !=? 'Apple_Terminal'         " Check for conflicts with Apple Terminal app
  set termguicolors
else
  if $TERM !=? 'xterm-256color'
    set termguicolors
  endif
endif

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Sources
source $HOME/.config/nvim/plug-config/coc.vim

call plug#begin()

  " Appearance
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'elvessousa/sobrio'
  Plug 'ap/vim-css-color'
  Plug 'ajmwagar/vim-emoticons'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'navarasu/onedark.nvim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'sainnhe/sonokai'
  Plug 'xiyaowong/nvim-transparent'
  
  " Utilities
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdcommenter'
  Plug 'sirver/ultisnips'
  
  " Completion / Linters / formatters
  Plug 'neoclide/coc.nvim' , { 'branch': 'release' }
  Plug 'plasticboy/vim-markdown'

call plug#end()


let g:transparent_enabled = v:true
let g:sonokai_style = 'maia'
let g:sonokai_better_performance = 1
let g:sonokai_cursor = 'blue'

colorscheme sonokai

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme = 'sonokai'

" NERD Configuration
let NERDTreeShowHidden=0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nmap <C-k> <Plug>NERDCommenterToggle
vmap <C-k> <Plug>NERDCommenterToggle<CR>gv
nnoremap <C-n> :NERDTreeToggle<CR>

" Normal Mode remappings
nnoremap <F2> :bo 10 sp term://zsh<CR>
nnoremap <C-A-f> :call CocAction('format')<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>

" Auto Commands
augroup auto_commands
    autocmd filetype netrw call Netrw_mappings()
augroup END

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" UltraSnips Config
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:python_recommended_style = 0

" Devicons Config
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

au BufRead,BufNewFile *.asm setfiletype nasm
au BufRead,BufNewFile *.s setfiletype nasm
au BufRead,BufNewFile *.S setfiletype nasm
autocmd FileType nasm setlocal tabstop=8 shiftwidth=8 softtabstop=8 expandtab
