Plug 'vim-test/vim-test'

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" {{{{{
" PHP
let g:test#php#phpunit#executable = 'docker-compose exec <container-name> ./vendor/bin/phpunit'
let g:test#php#behat#executable = 'docker-compose exec <container-name> <behat-executable-binary-file>'
" }}}}}

" {{{{{
" Python
" let test#python#runner = 'pytest'
" let g:test#python#pytest#executable = <path-to-binary-file>
" }}}}}

" {{{{{
" test#strategy 
" basic
" make
" neovim ✅
" vimterminal
" dispatch
" vimux
" tslime
" slimux
" neoterm
" floaterm 🔥
" asyncrun_background_term ✅
" asyncrun_background ❎ quickfix does not work |||the input device is not a TTY|||
" asyncrun ❎ quickfix does not work |||the input device is not a TTY|||
" neomake
" makegreen ❌
" vimshell
" vtr
" tmuxify
" vimproc
" asyncrun
" terminal
" iterm
" kitty
" shtuff
" harpoon

let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neovim',
  \ 'suite':   'asyncrun_background_term',
\}

" Do not display the test command beore running it
let g:test#echo_command = 0

" In neovim mode, test will run on terminal vim in insert mode.
" It's not quite right because as soon as the test is done, <enter> will
" close it.
" These options will just make it normal mode to let you scroll
let g:test#neovim#start_normal = 1 " If using neovim strategy
let g:test#basic#start_normal = 1 " If using basic strategy

" This make it easy to switch to normal mode on terminal mode
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
" }}}}}

" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

augroup AutoDeleteTestTermBuffers
    autocmd!
    autocmd BufLeave term://* bdelete!
augroup END
