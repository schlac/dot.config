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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'        " table formating
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'         " fzf fuzzy finder (use ^, $ and ' for anchored and exact matches)
Plug 'junegunn/vim-emoji'       " emoji completion
Plug 'lfv89/vim-interestingwords' " highlight words <leader>k
Plug 'neovim/nvim-lspconfig'    " language server configurations
Plug 'nvim-lua/completion-nvim'
"Plug 'plasticboy/vim-markdown'  " markdown folding
Plug 'preservim/nerdtree'       " file tree
Plug 'sjl/badwolf'              " color scheme
"Plug 'tpope/vim-characterize'   " character details ga
Plug 'tpope/vim-fugitive'       " git integration
Plug 'tpope/vim-unimpaired'     " handy [ mappings
Plug 'vim-airline/vim-airline'  " nicer status line
Plug 'vim-scripts/taglist.vim'  " list ctags in side window
call plug#end()

" use ripgrep if installed
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
