set nocompatible              " be iMproved, required
filetype off                  " required

set exrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required


" Status bar
Plugin 'bling/vim-airline'

Plugin 'ervandew/supertab'

" General behavior
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-sensible'
Plugin 'mileszs/ack.vim'

" Minibuffer
Plugin 'christoomey/vim-tmux-navigator'

" Git integration
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-fugitive'

" Comment shortcuts
Plugin 'tomtom/tcomment_vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" File browsing and opening
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'

" CSS / LESS / SASS
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'

" Scala . . . heh
Plugin 'derekwyatt/vim-scala'

" Themes and colors
Plugin 'ajh17/Spacegray.vim'
Plugin 'flazz/vim-colorschemes'

" JS Plugins
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'millermedeiros/vim-esformatter'
Plugin 'scrooloose/syntastic'

if has("unix")
	let s:uname = system("uname -s")
	if s:uname =~ "Darwin"
		" Do Mac stuff here
		" Dear Diary
		Plugin 'glidenote/newdayone.vim'
	endif
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'passive_filetypes': ['php'] }

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
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

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

" ESFORMATTER
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" Set unknown filetypes
au BufRead,BufNewFile .esformatter setfiletype json
au BufRead,BufNewFile .jshintrc setfiletype json
au BufRead,BufNewFile .eslintrc setfiletype json

autocmd Filetype json setlocal ts=2 sw=2 expandtab

set secure
