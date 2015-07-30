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
"Plugin 'editorconfig/editorconfig-vim'
"Plugin 'Chiel92/vim-autoformat'
Plugin 'mileszs/ack.vim'

" Minibuffer
Plugin 'fholgado/minibufexpl.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Clojure
"Plugin 'tpope/vim-fireplace'

" Dear Diary
" Plugin 'glidenote/newdayone.vim'

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
" Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'millermedeiros/vim-esformatter'
"Plugin 'pangloss/vim-javascript'
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
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy'
let g:syntastic_html_tidy_ignore_errors=['trimming empty']
let g:syntastic_mode_map = { 'passive_filetypes': ['php'] }

autocmd FileType javascript let b:syntastic_javascript_eslint_args = '--rulesdir /box/www/current/tools/js/eslint-rules'

" Nerdtree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

" BOX INDENTATION RULES
set shiftwidth=8
set tabstop=8
autocmd Filetype php setlocal ts=4 sw=4 expandtab
autocmd Filetype json setlocal ts=2 sw=2 expandtab
"autocmd Filetype javascript setlocal noet ci pi sts=0 sw=4 ts=4

" ESFORMATTER
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" Set unknown filetypes
au BufRead,BufNewFile .esformatter setfiletype json

"autocmd FileType * set tabstop=4|set shiftwidth=4
"set expandtab

" TMUX HIT SHOW COPY PASTE SSH STUFFS
function! PropagatePasteBufferToOSX()
	let @n=getreg("*")
	call system('pbcopy-remote', @n)
	echo "done"
endfunction

function! PopulatePasteBufferFromOSX()
	let @+ = system('pbpaste-remote')
	echo "done"
endfunction

nnoremap <leader>6 :call PopulatePasteBufferFromOSX()<cr>
nnoremap <leader>7 :call PropagatePasteBufferToOSX()<cr>

" if has("gui_running")
" 	let s:uname = system("uname")
" 	if s:uname == "Darwin\n"
" 		set guifont=Inconsolata\ for\ Powerline:h15
" 	endif
" endif
