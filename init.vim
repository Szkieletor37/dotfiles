set clipboard=unnamedplus
set shiftwidth=2
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/szkieletor/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/szkieletor/.vim/bundles')
  call dein#begin('/home/szkieletor/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/home/szkieletor/.vim/bundles/repos/github.com/Shougo/dein.vim')

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

colorscheme Tomorrow-Night-Eighties
