set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'jeaye/color_coded'
Plugin 'jamessan/vim-gnupg'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-expand-region'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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
set scrolloff=10
set list
set lcs=tab:▸·
set lcs+=trail:·
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set laststatus=2

let mapleader="\<space>"
nnoremap <leader><space> :noh<CR>
nnoremap ; :CtrlPBuffer<CR>

nnoremap j gj
nnoremap k gk

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"nnoremap <leader>w <C-w>v<C-w>l
"
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"Smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"Raimbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"CtrlP
nnoremap ; :CtrlPBuffer<CR>
nnoremap <Leader>p :CtrlP<CR>
let g:ctrlp_max_file = 0
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

highlight WhitespaceEOL ctermbg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

"expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set relativenumber
set ignorecase
set smartcase

set guioptions-=T
set guioptions-=m
set guioptions+=c
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=b

set mouse=a
set anti guifont=Sauce\ Code\ Powerline\ 9
"set anti guifont=Input\ Sans\ Regular\ 9

if version >= 702
  autocmd BufWinLeave * call clearmatches()
endif

set tags=.git/tags

autocmd Filetype gitcommit setlocal spell textwidth=72

au BufRead /tmp/mutt-* set tw=72
