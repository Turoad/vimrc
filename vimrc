"===============================
"Author: turoad
"Email: Turoad@126.com
"Readme: README.md 
"===============================

"basic
syntax on
set nocompatible
set fileformats=unix
set fileformat=unix
set number autoindent tabstop=2 shiftwidth=2 backspace=2 softtabstop=2 expandtab
set background=dark
"automatic indentation of the C/C++ Language
set cindent
"Parentheses match
set showmatch
"enable mouse
set mouse=a
"show line number and column number
set ruler
"show comand in status bar
set showcmd
"highlight text when search
set hlsearch
"incremental search
set incsearch
"ignore case when search
set ignorecase
"case sensitivity when there is one or more capital letters
set smartcase
set sidescroll=1
set whichwrap=b,s,<,>,[,]
set foldmethod=marker
"modify leader key
let mapleader = ","
let g:mapleader = ","
"highlight the current row 
set cursorline
filetype off

autocmd FileType c,cpp set cindent cinoptions=:0g0t0(sus

set rtp+=~/.vim/bundle/vundle/

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'taglist.vim'
Plugin 'grep.vim'
Plugin 'a.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Lokaltog/vim-powerline'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'L9'
Plugin 'ctrlp.vim'
Plugin 'Command-T'
Plugin 'vim-coffee-script'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
call vundle#end()
call glaive#Install()

filetype plugin indent on
let g:vim_markdown_folding_disabled = 1

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

