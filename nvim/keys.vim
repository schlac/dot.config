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
