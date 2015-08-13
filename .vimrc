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

autocmd FileType javascript let b:syntastic_javascript_eslint_args = '--rulesdir /box/www/current/tools/js/eslint-rules'


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

" Autoformat
noremap <F3> :Autoformat<CR><CR>

" NERDTree maps
nmap <C-n> :NERDTreeToggle<CR>

" map 'jk' to <ESC>
imap jk <Esc>

" Ctrlp maps
nmap <leader>p :CtrlP<CR>
nmap <leader>n :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files=0

syntax on

" ESFORMATTER
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" Set unknown filetypes
au BufRead,BufNewFile .esformatter,.eslintrc,.jshintrc setfiletype json

set secure
