set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'

syntax on
filetype plugin indent on


colorscheme solarized

set number
set nocompatible
set backspace=indent,eol,start
set showmatch
set ruler
set showmode
set undolevels=200
set autoindent
set history=50
set wildmenu
set ttyfast
set incsearch
set hlsearch
set mouse=a
set scrolloff=10
set list
set lcs=tab:»·
set lcs+=trail:·

set cursorline
hi CursorLine term=none cterm=none ctermbg=0
hi CursorColumn term=none cterm=none ctermbg=0

highlight WhitespaceEOL ctermbg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set guioptions-=T
set guioptions-=m
set guioptions+=c
set guioptions-=l
set guioptions-=r
set guioptions-=b
"set anti gfn=Ubuntu\ Mono\ 10
set anti guifont=Source\ Code\ Pro\ 9
