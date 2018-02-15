" set the runtime path to include Vundle and initialize
call plug#begin('~/.nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'AndrewRadev/vim-eco'
Plug 'airblade/vim-gitgutter'
Plug 'ajh17/Spacegray.vim'
Plug 'ap/vim-css-color'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
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
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'isRuslan/vim-es6', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'roxma/ncm-flow'
Plug 'roxma/ncm-rct-complete'
Plug 'roxma/nvim-cm-tern',  {'do': 'yarn install'}
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/python-support.nvim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'solarnz/thrift.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/paredit.vim'

Plug 'ryanoasis/vim-devicons'

" Add plugins to &runtimepath
call plug#end()

set splitbelow
set completeopt+=noselect

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:jsx_ext_required = 0

" othree/javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,react,jquery'

" Stupid mac
if has('nvim')
  nmap <BS> <C-W>h
endif

let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

autocmd FileType php LanguageClientStart

" Indentation
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab

autocmd Filetype markdown setlocal wrap

" Theme
colorscheme spacegray

" recording macros is not my thing
map q <Nop>

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'


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

filetype plugin on
filetype indent on

" map 'jk' to <ESC>
imap jk <Esc>

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

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, GitFiles command with preview window
command! -bang -nargs=? -complete=dir GitFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)
"

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

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

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

let g:LanguageClient_autoStart = 1
