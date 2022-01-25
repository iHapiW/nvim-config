" curl -fLO $Home/.config/nvim/autoload/plug.vim --create-dirs\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Syntax ( Add automatic syntax support for open files )
filetype plugin indent on
set fileformat=unix
syntax on
set encoding=utf-8

" Options set background=dark
set clipboard=unnamedplus                   " Enables Clipboard Sharing 
set completeopt=noinsert,menuone,noselect   " Modifies auto-complete menu to behave like IDE
set cursorline                              " Highlights current line
set hidden                                  " Hide unused buffers
set inccommand=split                        " Show replacement in a split screen befire apply to file
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0                           " Time in milisconds to run commands
set wildmenu                                " Shows more advanced menu for auto-completion
let mapleader=' '

" Tab Size
set expandtab
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2

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

" NetRW File Browser Config
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_win_size=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'

function! CreateInPreview()                  " Create file without opening buffer
  let l:filename = input('please enter filename: ')
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename
  redraw!
endfunction

function! Netrw_mappings()                   " Netrw: create file using touch instead of opening a buffer
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction

augroup auto_commands
    autocmd filetype netrw call Netrw_mappings()
augroup END

" Sources
source $HOME/.config/nvim/plug-config/coc.vim

call plug#begin()

  " Appearance
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'elvessousa/sobrio'
  
  " Utilities
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ap/vim-css-color'
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'sirver/ultisnips'
  
  " Completion / Linters / formatters
  Plug 'neoclide/coc.nvim' , { 'branch': 'master', 'do' : 'yarn install'}
  Plug 'plasticboy/vim-markdown'

call plug#end()

" Color Scheme Configuration
colorscheme sobrio
let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDTree Configuration
let NERDTreeShowHidden=1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Coc Formatter Config
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Normal Mode remappings
"nnoremap <C-q> :q<CR>
"nnoremap <C-s> :w<CR>
nnoremap <F4> :bd<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F2> :bo 20 sp term://zsh<CR>
nnoremap <C-A-f> :call CocAction('format')<CR>
nmap <C-k> <Plug>NERDCommenterToggle
vmap <C-k> <Plug>NERDCommenterToggle<CR>gv

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>

" Auto Commands
augroup auto_commands
  autocmd BufWrite *.py call CocAction('format')
augroup END

" UltraSnips Config
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
