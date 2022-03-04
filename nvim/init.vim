" General
set nocompatible    " No vi compatibility

" Install Plug
let s:vimdir = $HOME . '/.config/nvim'
if empty(glob(s:vimdir . '/autoload/plug.vim'))
  silent exe '!' 'curl -fLo' s:vimdir . '/autoload/plug.vim --create-dirs'
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:vimdir . '/plugged')
Plug 'airblade/vim-gitgutter'   " show git change indicators
Plug 'ap/vim-css-color'         " show #1d829e in color
Plug 'bling/vim-airline'        " nicer status line
Plug 'chrisbra/unicode.vim'     " unicode completion
Plug 'godlygeek/tabular'        " table formating
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'         " fzf fuzzy finder (use ^, $ and ' for anchored and exact matches)
Plug 'junegunn/vim-emoji'       " emoji completion
Plug 'lfv89/vim-interestingwords' " highlight words <leader>k
"Plug 'plasticboy/vim-markdown'  " markdown folding
Plug 'preservim/nerdtree'       " file tree
Plug 'sjl/badwolf'              " color scheme
"Plug 'tpope/vim-characterize'   " character details ga
Plug 'tpope/vim-fugitive'       " git integration
Plug 'tpope/vim-unimpaired'     " handy [ mappings
Plug 'vim-airline/vim-airline'  " nicer status line
Plug 'vim-scripts/taglist.vim'  " list ctags in side window
Plug 'neovim/nvim-lspconfig'    " language server configurations
Plug 'nvim-lua/completion-nvim'
call plug#end()

set completefunc=emoji#complete " <C-k><C-u>

set number          " Show line numbers
set cursorcolumn    " Show vline on cursor
set cursorline      " Show hline on cursor
set mouse=n         " Use mouse in normal mode

set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set list            " Show trailing whitespaces
" Show trailing whitespace and spaces before a tab:
set listchars=tab:▸\ ,trail:▒ " Set chars for whitespaces
set textwidth=80    " Line wrap (number of cols)
set colorcolumn=+1  " Show vertical ruler at textwidth
set visualbell      " Use visual bell (no beeping)

set ruler           " Show row and column ruler information
set showcmd         " Show current command
set showmatch       " Highlight matching brace
set hlsearch        " Highlight all search results
set smartcase       " Enable smart-case search
set ignorecase      " Always case-insensitive
set incsearch       " Searches for strings incrementally
set scrolloff=4     " Give context when scrolling

set expandtab       " Use spaces instead of tabs
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tab
set shiftwidth=4    " Number of auto-indent spaces
set softtabstop=4   " Number of spaces per Tab

set wildmenu        " Use command line menu
set spell           " Enable spell-checking
set spelllang=en_us,de_de " Set spell checking to en_US
"set encoding=utf-8 nobomb " use UTF8 without BOM

set lazyredraw      " don't update the display while executing macros
set ttyfast         " Send more characters at a given time.

set autoread        " Reload contents automatically from disk
set backspace=indent,eol,start  " Backspace behaviour
if !has('win32')    " Do not do this when running in Windows
    set path+=**    " _fuzzy find_ in sub-directories
endif
if has('nvim')
  set termguicolors " true color
endif

set tags=./tags;$HOME   " Search tags locally and upwards
"set tags+=/usr/local/share/ctags

syntax enable       " Enable syntax highlighting
filetype plugin on  " Enable visual filetry

"override background color on bad whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"set background dark
try
    if $TERMINAL_EMULATOR =~ 'JetBrains'
        color desert  " set fallback theme in pycharm term
    else
        color badwolf
    endif
catch /^Vim\%((\a\+)\)\=:E185/
    color desert    " Set fallback theme
endtry
match ExtraWhitespace /\s\+$\| \+\ze\t/

let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_folding_style_pythonic = 1

" create persistent file backups
" see 'set backupdir?' for location
silent execute '!mkdir -p ~/.backup/'
set backupdir=.backup/,~/.backup/,/tmp//
silent execute '!mkdir -p ~/.swp/'
set directory=.swp/,~/.swp/,/tmp//
silent execute '!mkdir -p ~/.undo/'
set undodir=.undo/,~/.undo/,/tmp//
set backup
"undo file
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
endif

" use ripgrep if installed
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"configure language servers
if has('nvim')
lua << EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
end
require'lspconfig'.pylsp.setup{on_attach=on_attach_vim}
EOF
endif

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Little Helper Commands
command! Date read !date '+\# `\%F \%a` \%H:\%M-'

"" format tables while writing
"" https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|.*|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Key Bindings
" Change mapleader
let mapleader = " "      " default '\'
"let maplocalleader = " " " default 'none'

" Easy exit terminal
tnoremap <Esc> <C-\><C-n>

" Use space to toggle folding
"nnoremap <TAB> za
"nnoremap <C-TAB> zA " collides with <c-i> (jumplist forward)
" When in terminal, <C-Space> gets interpreted as <C-@>
nmap <C-@> <C-Space>

" Use CTRL-s for saving, also in Insert mode
noremap <C-s> :update<cr>
vnoremap <C-s> <C-c>:update<cr>
inoremap <C-s> <C-o>:update<cr>

nnoremap <leader>b :Buffers<cr>
" fuzzy find files
nnoremap <leader>p :Files<cr>
" grep in files
nnoremap <leader>gg :Rg<cr>
" grep for name under cursor
command! -bang -nargs=* Rgw call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <leader>g :Rgw <c-r><c-w><cr>
nnoremap <leader>f :call fzf#vim#tags(expand('<cword>'))<cr>
" toggle file tree
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-m> :NERDTreeFind<cr>

" toggle wrap
nnoremap <leader>w :set wrap!<cr>
