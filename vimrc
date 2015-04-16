set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'

Plugin 'gmarik/vundle'
"Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'

call vundle#end()

let g:airline_powerline_fonts = 1

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
set lcs=tab:▸·
set lcs+=trail:·
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set laststatus=2

let mapleader=","
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
"noremap <F11> :set list!<CR>
"
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"
"===============================================================================
"" Unite
"===============================================================================

"" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'build/',
      \ 'regress_final/',
      \ 'regress/',
      \ 'tmp/',
      \ 'pgsql/',
      \ 'libexec/',
      \ 'share/',
      \ 'lib/',
      \ 'daemons/memcached/',
      \ 'daemons/redis/',
      \ 'daemons/trams/tests/',
      \ 'util/',
      \ 'doc/',
      \ 'modules/',
      \ 'logs/',
      \ 'test_profies/',
      \ 'test_db/',
      \ 'www/',
      \ 'rpm/',
      \ 'thrift_api/',
      \ 'python/',
      \ 'pgsql_slave/',
      \ '.pyc',
      \ ], '\|'))

nnoremap [unite] <Nop>
nmap <space> [unite]


" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -start-insert -buffer-name=files file_rec/async<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nmap <c-p> [unite]u
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers file_mru buffer<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  " nmap <buffer> <ESC> <Plug>(unite_insert_enter)
  imap <buffer> <ESC> <Plug>(unite_exit)
  " imap <buffer> <c-j> <Plug>(unite_select_next_line)
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  nmap <buffer> <tab> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <s-tab> <Plug>(unite_loop_cursor_up)
  imap <buffer> <c-a> <Plug>(unite_choose_action)
  imap <buffer> <Tab> <Plug>(unite_insert_leave)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

endfunction

let g:unite_data_directory = "~/.unite"

let g:unite_split_rule = "bot"
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

let g:unite_source_rec_max_cache_files = 99999

"===============================================================================

"set cursorline
"hi CursorLine term=none cterm=none ctermbg=0
"hi CursorColumn term=none cterm=none ctermbg=0

highlight WhitespaceEOL ctermbg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

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

set anti guifont=Sauce\ Code\ Powerline\ 9
"set anti guifont=Input\ Sans\ Regular\ 9

if version >= 702
  autocmd BufWinLeave * call clearmatches()
endif

set tags=.git/tags

au BufRead /tmp/mutt-* set tw=72
