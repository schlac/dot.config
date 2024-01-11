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
