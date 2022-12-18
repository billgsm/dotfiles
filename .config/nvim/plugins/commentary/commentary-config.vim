augroup FileTypeOverrides
    autocmd!
    autocmd FileType php setlocal commentstring=//%s
    autocmd TermOpen * setlocal nospell
augroup END
autocmd FileType php setlocal commentstring=//\ %s
" gcc to comment a line
" gcj to comment the current and the line below
" gc4j to comment the current and four lines below
