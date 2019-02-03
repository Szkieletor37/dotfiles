"Basic Settings---------------------------------{{{
set clipboard=unnamedplus
set shiftwidth=2
set number
set relativenumber
set guicursor=
"-----------------------------}}}

"Mappings---------------------------------{{{
let mapleader = ","
nnoremap <leader>ev :vsplit ~/dotfiles/init.vim<cr>
nnoremap <leader>sv :source ~/dotfiles/init.vim<cr>
nnoremap <leader>' viw<esc>a'<esc>bi"<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j
nnoremap H ^
nnoremap L $
nnoremap <leader>b :buffers<cr>:buffer<Space>
inoremap <leader><c-u> <esc>bgUwea
inoremap jk <esc>
inoremap <C-[> <nop>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
"End mapping------------------------------}}}

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
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('w0rp/ale')
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

"Color------------------------------------
colorscheme Tomorrow-Night-Eighties
highlight LineNr ctermfg=grey"}}}
