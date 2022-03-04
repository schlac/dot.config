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
