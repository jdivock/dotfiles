set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ervandew/supertab'

" General behavior
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }

" VimSurround
Plug 'tpope/vim-surround'

" SnipMate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" to prevent clash with youcompleteme, change snippet trigger
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" React snippets
Plug 'justinj/vim-react-snippets', { 'for': 'javascript' }

" ES6 Snippets
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }

Plug 'christoomey/vim-tmux-navigator'

Plug 'blueyed/smarty.vim'

" Git integration
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'

" Comment shortcuts
Plug 'tomtom/tcomment_vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Workflowy
Plug 'lukaszkorecki/workflowish', { 'for': 'wofl' }

" File browsing and opening
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'

" CSS / LESS / SASS
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

" Scala . . . heh
Plug 'derekwyatt/vim-scala', {'for': 'scala' }

" Themes and colors
Plug 'ajh17/Spacegray.vim'
Plug 'flazz/vim-colorschemes'

" JS Plugins
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'scrooloose/syntastic'

" TERN
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
let g:tern_map_keys=1
let g:tern_map_prefix = '<leader>'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" DayOne
if has("unix")
	let s:uname = system("uname -s")
	if s:uname =~ "Darwin"
		" Do Mac stuff here
		" Dear Diary
		Plug 'glidenote/newdayone.vim'
	endif
endif

" Add plugins to &runtimepath
call plug#end()

" Indentation
autocmd Filetype json setlocal ts=2 sw=2 expandtab

" Theme
colorscheme spacegray

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'passive_filetypes': ['php'] }
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ]

" autocmd FileType javascript let b:syntastic_javascript_eslint_args = '--rulesdir /box/www/current/tools/js/eslint-rules'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Powerline config options
" set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
let g:airline_theme='powerlineish'

set number
set laststatus=2

let mapleader = ','

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" OLD INDENTATION
" set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Autoformat
noremap <F3> :Autoformat<CR><CR>

" NERDTree maps
nmap <C-n> :NERDTreeToggle<CR>

" map 'jk' to <ESC>
imap jk <Esc>

" Ctrlp maps
nmap <leader>p :CtrlP<CR>
nmap <leader>n :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

syntax on

" Remove whitespace on save
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

" Set unknown filetypes
au BufRead,BufNewFile .jshintrc setfiletype json
au BufRead,BufNewFile .eslintrc setfiletype yaml

autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab

set secure
set exrc
