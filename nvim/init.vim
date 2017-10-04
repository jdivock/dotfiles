" set the runtime path to include Vundle and initialize
call plug#begin('~/.nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'AndrewRadev/vim-eco'
Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'ajh17/Spacegray.vim'
Plug 'ap/vim-css-color'
Plug 'arakashic/chromatica.nvim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'blueyed/smarty.vim'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'calebeby/ncm-css'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala', {'for': 'scala' }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'fsharp/vim-fsharp', {'for': 'fsharp', 'do':  'make fsautocomplete'}
Plug 'godlygeek/tabular'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jiangmiao/auto-pairs'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinj/vim-react-snippets', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'kchmck/vim-coffee-script'
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'moll/vim-node'
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'neomake/neomake'
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'roxma/ncm-flow'
Plug 'roxma/ncm-rct-complete'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/python-support.nvim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'solarnz/thrift.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/paredit.vim'

Plug 'ryanoasis/vim-devicons'

" Add plugins to &runtimepath
call plug#end()

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" " Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.nvim/plugged/vim-snippets, ~/.nvim/plugged/vim-react-snippets, ~/.nvim/pluggin/vim-es6 ~/.nvim/plugged/neosnippet-snippets'

let g:echodoc_enable_at_startup=1
set splitbelow
set completeopt+=noselect

let g:chromatica#enable_at_startup=1
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'

autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.jsx Neoformat

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:jsx_ext_required = 0

set completeopt=longest,menuone,preview

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
autocmd FileType javascript.jsx let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Stupid mac
if has('nvim')
  nmap <BS> <C-W>h
endif

let g:neomake_javascript_enabled_makers = ['flow', 'eslint']
let g:neomake_go_gometalinter_args = ['--disable-all', '--enable=gosimple', '--enable=staticcheck', '--enable=unused']
autocmd! BufWritePost,BufEnter * Neomake

let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')


autocmd FileType php LanguageClientStart

" Indentation
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab

" Theme
colorscheme spacegray

" recording macros is not my thing
map q <Nop>

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

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
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

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
nnoremap <leader>wr :set wrap! wrap?<CR>

" Quick spelling fix
nnoremap <leader>fs 1z=

" Open neovim config
nnoremap <leader>rc :e $HOME/.config/nvim/init.vim<CR>

" Generate ctags
nnoremap <leader>dc :!ctags -R --languages=-javascript --exclude=.git --exclude=log --exclude=target --fields=+ialS --extra=+q .<CR>
" Generate ctags with ripper-tags, specifically for Ruby
nnoremap <leader>dr :!ripper-tags -R --force<CR>

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

autocmd BufNewFile,BufRead *.txt set wrap

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

" Set unknown filetypes
au BufRead,BufNewFile .jshintrc setfiletype json
au BufRead,BufNewFile .eslintrc setfiletype yaml

au BufWritePost * redraw!


set secure
set exrc
