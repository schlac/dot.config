" Install Plug
let s:vimdir = $HOME . '/.config/nvim'
if empty(glob(s:vimdir . '/autoload/plug.vim'))
  silent exe '!' 'curl -fLo' s:vimdir . '/autoload/plug.vim --create-dirs'
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:vimdir . '/plugged')
Plug 'sjl/badwolf'                   " color scheme

Plug 'scrooloose/nerdtree'           " file tree
Plug 'vim-airline/vim-airline'       " nicer status line
let g:airline_powerline_fonts = 1

Plug 'tpope/vim-commentary'          " comment blocks etc with gc
Plug 'godlygeek/tabular'             " table formating
Plug 'preservim/vim-markdown'        " markdown folding
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_follow_anchor = 1
"let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_minlines = 300

Plug 'tpope/vim-fugitive'            " git integration
Plug 'airblade/vim-gitgutter'        " show git change indicators
Plug 'iautom8things/gitlink-vim'     " generate github link
command GitLink :echo gitlink#GitLink()

Plug 'lfv89/vim-interestingwords'    " highlight words <leader>k
Plug 'ap/vim-css-color'              " show #1d829e in color
Plug 'chrisbra/unicode.vim'          " unicode completion

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'              " fzf fuzzy finder (use ^, $ and ' for anchored and exact matches)

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neovim/nvim-lspconfig'         " language server configurations
Plug 'nvim-lua/completion-nvim'

Plug 'tpope/vim-unimpaired'          " handy [ mappings
Plug 'vim-scripts/taglist.vim'       " list ctags in side window
call plug#end()

" use ripgrep if installed
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
