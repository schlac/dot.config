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
