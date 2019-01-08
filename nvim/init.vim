set nocompatible
filetype off

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'terryma/vim-smooth-scroll'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
"Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/limelight.vim'
"Plug 'jaxbot/semantic-highlight.vim'
Plug 'arakashic/chromatica.nvim', { 'do': function('DoRemote') }
Plug 'kien/rainbow_parentheses.vim'
Plug 'w0rp/ale'

Plug 'jamessan/vim-gnupg'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-git'
Plug 'othree/html5.vim'
Plug 'leshill/vim-json'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'vim-scripts/valgrind.vim'
Plug 'IN3D/vim-raml'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'rhysd/vim-clang-format'

Plug 'rking/ag.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'

call plug#end()

set t_Co=256
syntax on
"colorscheme solarized
colorscheme NeoSolarized
filetype plugin indent on

let mapleader=" "
set backspace=indent,eol,start

"call togglebg#map("<F5>")

set wildmode=full
set wildmenu
set background=dark
set mouse=a
set undolevels=200
set autoindent
set history=50
set number
set relativenumber
set ruler
set wrap
set colorcolumn=100
set textwidth=100
set smartcase
set cursorline
set cino+=(0

set list listchars=tab:»·,trail:·

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

nmap <leader><tab> :b#<cr>
map <leader>v :vsplit<CR>

map <leader>n :NERDTreeToggle<CR>

inoremap jj <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap j gj
nnoremap k gk

nnoremap <leader><space> :noh<CR>

" Copy to clipboard
vnoremap  <leader>y  "*y
nnoremap  <leader>Y  "*yg_
nnoremap  <leader>y  "*y
"nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "*p
nnoremap <leader>P "*P
vnoremap <leader>p "*p
"vnoremap <leader>P "+P

" Easytag
" let g:easytags_async = 1
" set tags=.git/tags
" let g:easytags_dynamic_files = 1

" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Airline
let g:airline_powerline_fonts = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#delimiters = ['/', '.', '::', ':', '#', '->']
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'

let g:deoplete#sources#jedi#show_docstring = 0


imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"SuperTab like snippets behavior.
"imap <expr><TAB>
 "\ pumvisible() ? "\<C-n>" :
 "\ neosnippet#expandable_or_jumpable() ?
 "\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"
" fzf
let g:fzf_layout = { 'down': '~20%' }
nnoremap <leader>pg :GFiles<cr>
nnoremap <leader>pf :Files<cr>
nnoremap <leader>pb :Buffers<cr>

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" jsx
let g:jsx_ext_required = 0

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" grep
nnoremap <leader>/ :Grepper -noprompt -cword -tool ag<cr>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

" Supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Chromatica
let g:chromatica#libclang_path='/usr/lib/libclang.so'
let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1

"let g:neoterm_position = 'vertical'

" ale
let g:ale_sign_warning = '—'
let g:ale_sign_error = '⋄'
let g:airline#extensions#ale#enabled = 1

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype c setlocal ts=4 sw=4 expandtab


" Enable auto format
autocmd FileType c ClangFormatAutoEnable
