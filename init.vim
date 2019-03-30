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
set list listchars=tab:\▸\-
set tabstop=2
set shiftwidth=2
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
nnoremap <leader>ev :vsplit ~/dotfiles/init.vim<cr>
"apply init.vim quickly
nnoremap <leader>sv :source ~/dotfiles/init.vim<cr>
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

"Filetype-Specifics----------------------------------
"Filetype:vim{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <leader>c i"
  autocmd FileType vim inoremap <buffer> <leader><cr> <c-O>x
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
"Filetype:cpp{{{
augroup filetype_cpp
  autocmd!
  autocmd FileType cpp nnoremap <buffer> <leader>c I//<esc>
augroup END
"}}}
"Filetype:md{{{
augroup filetype_md
  autocmd!
  autocmd FileType markdown set spell
  autocmd FileType markdown set spelllang=en,cjk
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

"dein Scripts-----------------------------{{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/bundles')
  call dein#begin('$HOME/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('qnighy/satysfi.vim')
  call dein#add('w0rp/ale')
  call dein#add('w0ng/vim-hybrid')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"Color------------------------------------{{{
set background=dark
colorscheme hybrid
highlight LineNr ctermfg=grey
"}}}

let g:ale_linters = {
			\ 'php' : ['phan'],
			\}
"}}}
