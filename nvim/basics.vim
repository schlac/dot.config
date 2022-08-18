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

" create persistent file backups
" see 'set backupdir?' for location
silent execute '!mkdir -p ~/.backup/'
set backupdir=~/.backup/,/tmp//
silent execute '!mkdir -p ~/.swp/'
set directory=~/.swp/,/tmp//
silent execute '!mkdir -p ~/.undo/'
set undodir=~/.undo/,/tmp//
set backup
"undo file
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
endif
