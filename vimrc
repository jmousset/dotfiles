"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

"Required:
  set runtimepath+=/home/jeremy.mousset/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/jeremy.mousset/.vim/bundle'))

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
NeoBundle 'vim-airline/vim-airline-themes'
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
NeoBundle 'Rykka/InstantRst'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-colorscheme-switcher'
"NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'benmills/vimux'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'vim-scripts/Align'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'dhruvasagar/vim-table-mode'
"NeoBundle 'nvim-lua/plenary.nvim'
"NeoBundle 'nvim-telescope/telescope.nvim'
"NeoBundle 'skammer/vim-css-color'
"NeoBundle 'groenewege/vim-less'
NeoBundle 'psf/black'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

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
se smartcase

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
set backspace=indent,eol,start

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
"let g:airline_theme = 'wombat'
"let g:airline_theme='molokai'
let g:airline_theme='kalisi'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

"""""""""""""
" ultisnips 
"""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsSnippetDirectories=["UltiSnips"]


"""""""""
" GUNDO"
"""""""""
nnoremap <F5> :GundoToggle<CR>


"""""""
" syntastic"
"""""""
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_pylint_post_args="--max-line-length=80"
let g:syntastic_python_flake8_post_args='--ignore=D100,D101,D102,D105,D200,D204,D205,D300,D400,D401,E123,E124,E126,E127,E128,W404,W503,N806,W504 --max-line-length=80'
let g:syntastic_javascript_checkers = ['standard']

"""""""""""""
"Unite config"
"""""""""""""
" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  "let g:unite_source_grep_default_opts = ' --nogroup --nocolor --column --ignore="*.log" --ignore="*.csv" --ignore="*.json"'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --ignore="*.log" --ignore="*.json" --ignore="node_modules" --ignore="bower_components"'
  "let g:unite_source_grep_default_opts = ' --follow --nogroup --nocolor --column --ignore="*.log" --ignore="*.csv" --ignore="*.json"'
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

" TRYING OUT telescope
"nnoremap <leader>w :Telescope grep_string<CR>
"nnoremap <leader>a :Telescope live_grep<CR>
"nnoremap <C-p> :Telescope find_files<CR>

"ack.vim
""""""""

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"tryton-vim
""""""""

let g:tryton_trytond_path = "$VIRTUAL_ENV/tryton-workspace/trytond"
let g:tryton_default_mappings = 1

"CTRLP
""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"NERDTREE
""""""""
let NERDTreeIgnore=['\.pyc$', '\.orig$']

"Vimux
""""""
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

""""""""
"colorscheme
""""""""

"these 2 are good in bad lighting conditions
"colorscheme desertlink
"colorscheme evolution

"big font
"colorscheme dull
colorscheme heroku
"colorscheme monokain

"nothing good from first to "dante"

"colorscheme default

hi Search cterm=NONE ctermfg=white ctermbg=darkgrey
hi SpellBad cterm=NONE ctermfg=green ctermbg=red
hi SpellCap cterm=NONE ctermfg=green ctermbg=red
hi Folded cterm=None ctermfg=none ctermbg=None ctermbg=None
hi Visual ctermbg=black
hi CursorLine  cterm=NONE ctermbg=black ctermfg=None guibg=black guifg=white
set cursorline
"remove background for vertical pslit
hi VertSplit cterm=NONE ctermfg=red ctermbg=NONE
set background=dark
set t_Co=256


"mouse in all modes
set mouse=a

"options
set wildmenu
set wildignore+=*.pyc,*.orig

" CUSTOM MAPPINGS
"""""""""""""""""""""""
"next color scheme with  leader co
nnoremap <leader>co :NextColorScheme<CR>

"navigate between splits with Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"map =j to json formatting"
nnoremap =j :%!python -m json.tool<CR>

"make current file's dir > local working dir
nnoremap <leader>cd :lcd %:h<CR>

"to normal mode with jk
:imap jk <Esc>
:imap kj <Esc>
"save with space from normal mode
nnoremap <space> :w<CR>
nnoremap <space><space>  :x<CR>

" make jk , kj , spacespace practical by reducing timetout
" default timeout is 1000 milliseconds
set timeoutlen=400

"useful for prose
nnoremap Q gqap

"less to css
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

"nvim specials
":tnoremap <C-h> <C-\><C-n><C-w>h
":tnoremap <C-j> <C-\><C-n><C-w>j
":tnoremap <C-k> <C-\><C-n><C-w>k
":tnoremap <C-l> <C-\><C-n><C-w>l
