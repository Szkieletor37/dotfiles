"Basic Settings---------------------------------{{{
set clipboard=unnamedplus
set number
set relativenumber
set guicursor=
set display=lastline
"set height of Pop Up Menu
set pumheight=10
set showmatch
set matchtime=1
set cursorline
"command line completion
set wildmode=list:longest

"Tab----------------------{{{
set listchars=tab:»\ ,trail:-,eol:↲,extends:»,precedes:«
set list
set tabstop=2
set shiftwidth=2
set expandtab

"------------------------}}}
"Search-------------------------{{{
"ignore case in a pattern
set ignorecase
"case-sensitive if a pattern includes capital
set smartcase
set hlsearch
set incsearch
"Searches wrap around the end of the file
set wrapscan
"-----------------------------}}}
"-----------------------------}}}

"Mappings---------------------------------{{{
let mapleader = ","
"map Y to yank until the end of line
nnoremap Y y$
"incriment, decriment
nnoremap + <C-a>
nnoremap - <C-x>
"edit init.vim quickly
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
"apply init.vim quickly
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
"enclosed a word by singlequote
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
"enclosed a word by doublequote
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
"insert a line right below
nnoremap <leader>o o<esc>k
"insert a line right above
nnoremap <leader>O O<esc>j
"jump the first of the line
nnoremap H ^
"jump the end of the line
nnoremap L $
"choose a buffer quickly
nnoremap <leader>b :buffers<cr>:buffer<Space>
"open the buffer used right before the current one
nnoremap <leader>p :execute "leftabove split" . bufname("#")<cr>
"highlight trailing whitespace
nnoremap <leader>w :match Error /\S\zs\s\+$/<cr>
"unhighlight trailing whitespace
nnoremap <leader>wn :match NormalNC /\S\zs\s\+$/<cr> 
"remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//e<cr>
"search in very magic mode automatically
nnoremap / /\v
"toggle highlighting items from the last search
nnoremap <leader>th :set hlsearch!<cr>
"to grep for the word under the cursor
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
inoremap <leader><c-u> <esc>bgUwea
inoremap jk <esc>
inoremap <C-[> <nop>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
vnoremap jk <esc>
"End mapping------------------------------}}}

"Autocmds--------------------------------------{{{
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END
"----------------------------------------------}}}

"Vundle.vim-----------------------------------{{{
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'w0ng/vim-hybrid'
Plugin 'plasticboy/vim-markdown'
Plugin 'tyru/open-browser.vim'
Plugin 'thinca/vim-quickrun'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}}

"General Settings, must be put after Vundle.vim{{{
filetype on
filetype plugin indent on

set background=dark
colorscheme hybrid
syntax on
highlight LineNr ctermfg=grey
highlight NonText ctermfg=4
"}}}
"
"Plugins settings{{{
"ale{{{
let g:ale_linters = {
\ 'php' : ['phan'],
\ 'cpp' : ['gcc'],
\}
let g:ale_fixers = {
\ 'cpp' : ['clang-format'],
\}
"}}}
"quickrun{{{
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
\ 'outputter': 'browser'
\ }
"}}}
"}}}

"Filetype-Specifics----------------------------------
"Filetype:vim{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <leader>c i"
  autocmd FileType vim inoremap <buffer> <leader><cr> <c-O>x
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
"Filetype:py{{{
augroup filetype_py
  autocmd!
  autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
"}}}
"Filetype:js{{{
augroup filetype_js
  autocmd!
  autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
  autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
  autocmd BufNewFile *.js 0r ~/dotfiles/nvim/init_js.txt
augroup END
"}}}
"------------------------------

