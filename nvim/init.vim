﻿"" General
set nocompatible    " No vi compatibility

" Install Plug
let s:vimdir = $HOME . '/.config/nvim'
if empty(glob(s:vimdir . '/autoload/plug.vim'))
  silent exe '!' 'curl -fLo' s:vimdir . '/autoload/plug.vim --create-dirs'
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:vimdir . '/plugged')
Plug 'ctrlpvim/ctrlp.vim'   " fuzzy file finder
Plug 'wsdjeg/FlyGrep.vim'   " nicer global grep
Plug 'bling/vim-airline'    " nicer status line
Plug 'sjl/badwolf'          " color sheme
Plug 'airblade/vim-gitgutter'  " show changed lines
call plug#end()

set number          " Show line numbers
set linebreak       " Break lines at word (requires Wrap lines)

set showbreak=+++   " Wrap-broken line prefix
set list            " Show trailing whitespaces
set listchars=tab:▸\ ,trail:▫ " Set chars for whitespaces
set textwidth=80    " Line wrap (number of cols)
set colorcolumn=+1  " Show vertical ruler at textwidth
set visualbell      " Use visual bell (no beeping)

set ruler           " Show row and column ruler information
set showcmd         " Show current command
set showmatch       " Highlight matching brace
set smartcase       " Enable smart-case search
set ignorecase      " Always case-insensitive
set incsearch       " Searches for strings incrementally

set expandtab       " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tab
set softtabstop=4   " Number of spaces per Tab

set wildmenu        " Use command line menu
set spell           " Enable spell-checking

set autoread        " Reload contens automatically from disk
set backspace=indent,eol,start  " Backspace behaviour
if !has('win32')    " Do not do this when running in Windows
    set path+=**    " "fuzzy find" in sub-directories
endif

syntax enable       " Enable syntax highlighting
filetype plugin on  " Enable visual filetry

try
    color badwolf
catch /^Vim\%((\a\+)\)\=:E185/
    color desert    " Set fallback theme
endtry

" Key Bindings
nnoremap <leader>g :FlyGrep<cr>

