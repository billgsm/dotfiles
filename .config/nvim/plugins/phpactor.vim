Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
augroup END
