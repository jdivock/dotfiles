" set the runtime path to include Vundle and initialize
call plug#begin('~/.nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'ap/vim-css-color'
Plug 'benekastah/neomake'
Plug 'blueyed/smarty.vim'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'carlitux/deoplete-ternjs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala', {'for': 'scala' }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinj/vim-react-snippets', { 'for': 'javascript' }
Plug 'mattn/gist-vim'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/jsdoc-syntax.vim', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/paredit.vim'

" DayOne
if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ "Darwin"
    " Do Mac stuff here
    " Dear Diary
    Plug 'glidenote/newdayone.vim'
  endif
endif

Plug 'ryanoasis/vim-devicons'

" Add plugins to &runtimepath
call plug#end()

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.nvim/plugged/vim-snippets, ~/.nvim/plugged/vim-react-snippets, ~/.nvim/pluggin/vim-es6 ~/.nvim/plugged/neosnippet-snippets'
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" Use deoplete.
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Stupid mac
if has('nvim')
  nmap <BS> <C-W>h
endif

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

" TERN
let g:tern_map_keys=1
let g:tern_map_prefix = '<leader>'

" Indentation
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab

" Theme
colorscheme spacegray

" recording macros is not my thing
map q <Nop>

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:jsx_ext_required = 0
" recording macros is not my thing
map q <Nop>

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Powerline config options
let g:airline_powerline_fonts = 1
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
let g:airline_theme='powerlineish'

set number
set laststatus=2

let mapleader = ','

" Copy to osx clipboard
vnoremap <C-c> "*y<CR>
vnoremap y "*y<CR>
nnoremap Y "*Y<CR>

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

" map 'jk' to <ESC>
imap jk <Esc>
let g:used_javascript_libs = 'react,underscore'

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set noshowmode
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
noremap <leader>f :Autoformat<CR>

" Wrap toggle
nnoremap <Leader>wr :set wrap! wrap?<CR>

" Quick spelling fix
nnoremap <Leader>fs 1z=

" Open neovim config
nnoremap <Leader>rc :e $HOME/.config/nvim/init.vim<CR>

" NERDTree maps
nmap <C-n> :NERDTreeToggle<CR>

" FZF
nmap <C-p> :GitFiles<CR>
nmap <leader>n :Buffers<CR>

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

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

au BufWritePost * redraw!


set secure
set exrc
