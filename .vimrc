set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Status bar
Plugin 'bling/vim-airline'

" General behavior
Plugin 'vim-scripts/paredit.vim'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-sensible'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Chiel92/vim-autoformat'

" Clojure
Plugin 'tpope/vim-fireplace'

" Dear Diary
Plugin 'glidenote/newdayone.vim'

" Git integration
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-fugitive'

" Comment shortcuts
Plugin 'tomtom/tcomment_vim'

" Markdown
Plugin 'plasticboy/vim-markdown'

" File browsing and opening
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'

" CSS / LESS / SASS
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'

" Themes and colors
Plugin 'ajh17/Spacegray.vim'
Plugin 'flazz/vim-colorschemes'

" JS Plugins
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'

" Plugin graveyard
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'einars/js-beautify'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'tpope/vim-haml'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Theme
colorscheme spacegray

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy'
let g:syntastic_html_tidy_ignore_errors=['trimming empty']

" Nerdtree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Powerline config options
"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
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

" NERDTree maps
nmap <C-k><C-b> :NERDTreeToggle<CR>

" Ctrlp maps
nmap <leader>p :CtrlP<CR>
nmap <leader>n :CtrlPBuffer<CR>

syntax on

if has("gui_running")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		set guifont=Inconsolata\ for\ Powerline:h15
	endif
endif
