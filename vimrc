"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

"Required:
  set runtimepath+=/home/jeremy/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/jeremy/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/Unite.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'rking/ag.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'JCavallo/tryton-vim'
NeoBundle 'Rykka/riv.vim'
NeoBundle 'kien/ctrlp.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


" Display line number
set number

" Ignore the case of normal letters.
set ignorecase

" If the search pattern contains upper case characters, override ignorecase
" option.
set smartcase

" Enable incremental search.
set incsearch

" Highlight search result.
set hlsearch

" Searches wrap around the end of the file.
"set wrapscan

" Default encoding is UTF8
set encoding=utf-8
set fileencoding=utf8


syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab


"set ',' as leader key
let mapleader=","


"""""""""""""
"airline config"
"""""""""""""
set noshowmode
"always display status line
set laststatus=2

"let g:airline_theme = 'bubblegum'
"let g:airline_theme = 'kolor'
let g:airline_theme = 'base16color'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 0


"""""""""
" GUNDO"
"""""""""
nnoremap <F5> :GundoToggle<CR>


"""""""
" syntastic"
"""""""
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_post_args='--ignore=E123,E124,E126,E128,E711,W404,F403'

"""""""""""""
"Unite config"
"""""""""""""
" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = ' --nogroup --nocolor --column --ignore="*.log" --ignore="*.csv"'
  "let g:unite_source_grep_default_opts = ' --follow --nogroup --nocolor --column --ignore="*.log" --ignore="*.csv"'
  "let g:unite_source_grep_default_opts =
  "\ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
  "\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.log''--ignore ' .
  "\'.bzr'' -ignore ''.log'''
  let g:unite_source_grep_recursive_opt = ''
endif


nnoremap <leader>f :Unite file <Enter>
nnoremap <leader>r :Unite -default-action=open -start-insert file_rec<CR>
nnoremap <leader>m :Unite -auto-preview -start-insert -default-action=persist_open file_mru<CR>
nnoremap <leader>b :Unite -auto-preview -start-insert -default-action=persist_open buffer<CR>
nnoremap <leader>a :Unite grep -auto-preview -default-action=persist_open<CR>
nnoremap <leader>w :UniteWithCursorWord grep -auto-preview -default-action=open <CR>
nnoremap <leader>x :UniteClose <CR>


"tryton-vim
""""""""

let g:tryton_trytond_path = "$VIRTUAL_ENV/tryton-workspace/trytond"

"CTRLP
""""""""
let g:ctrlp_working_path_mode = 0

"NERDTREE
""""""""
let NERDTreeIgnore=['\.pyc$', '\.orig$']

""""""""
"colorscheme
""""""""

"colorscheme default
colorscheme Monokai
hi Search cterm=NONE ctermfg=grey ctermbg=black
hi SpellBad cterm=NONE ctermfg=green ctermbg=red
hi SpellCap cterm=NONE ctermfg=green ctermbg=red
hi Folded cterm=None ctermfg=darkgreen ctermbg=None
hi Visual ctermbg=black

"mouse in all modes
set mouse=a

"options
set wildmenu
set wildignore+=*.pyc,*.orig

" CUSTOM MAPPINGS
"""""""""""""""""""""""
"navigate between splits with Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"map =j to json formatting"
nnoremap =j :%!python -m json.tool<CR>

"make current file's dir > local working dir
nnoremap <leader>cd :lcd %:h<CR>
nnoremap <leader>up :cd $VIRTUAL_ENV/tryton-workspace/<CR>

"to normal mode with jk
:imap jk <Esc>
:imap kj <Esc>
"save with space from normal mode
nnoremap <space> :w<CR>
