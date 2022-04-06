" General setup
if !has('gui_running')
  set t_Co=256
endif

" My own config
" """""""""""""
syntax on
" vim-devicons 
set encoding=UTF-8
" TextEdit might fail if hidden is not set.
set hidden

" show existing tab with 4 spaces width
set tabstop=4
" soft tab width
set softtabstop=4
set shiftwidth=4

" 4 spaces tab
set expandtab

set title
set ignorecase
set smartcase
set list
set listchars=tab:»·,trail:·

set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright

set confirm " Avoid exiting by accident
set exrc
set secure

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Allow more time for loading syntax on large files
set redrawtime=10000

set autoindent

" numbered lines
set number relativenumber

" add directories of ./ to path
set path=.
" set path+=**

" Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

set colorcolumn=80,120

" backup vim
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

" Highlight search
set hls

" reload files when they change on disk (e.g., git checkout)
set autoread

" space keyboard is bigger than most
let mapleader = "\<space>"
"-----------------------------------

"-----------------------------------------------------------------------
" Automatically install Plug
"-----------------------------------------------------------------------

" I need to think this through before I activate it.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/vim-fugitive.vim
source ~/.config/nvim/plugins/nerdtree.vim
" source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/sideways.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/vim-fetch.vim
source ~/.config/nvim/plugins/interestingwords.vim
source ~/.config/nvim/plugins/cucumber.vim
source ~/.config/nvim/plugins/tabular.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/repeat.vim
source ~/.config/nvim/plugins/speeddating.vim
source ~/.config/nvim/plugins/unimpaired.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/abolish.vim
source ~/.config/nvim/plugins/vim-sensible.vim
source ~/.config/nvim/plugins/syntastic.vim
" FIXME: maybe useless ?
" source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/basicscratch.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/autopairs.vim
source ~/.config/nvim/plugins/twig.vim
source ~/.config/nvim/plugins/ansible.vim
source ~/.config/nvim/plugins/bbye.vim
source ~/.config/nvim/plugins/plantuml.vim
source ~/.config/nvim/plugins/ferret.vim
source ~/.config/nvim/plugins/signify.vim
source ~/.config/nvim/plugins/vdebug.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/mundo.vim
source ~/.config/nvim/plugins/neomake.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/dockerfile.vim
source ~/.config/nvim/plugins/asyncrun.vim
source ~/.config/nvim/plugins/makegreen.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/eunuch.vim

call plug#end()
doautocmd User PlugLoaded

"------------------------------------------------------------------------------
" Miscellaneous
"------------------------------------------------------------------------------
augroup FileTypeOverrides
    autocmd!
    " FIXME does not work 😭
    autocmd FileType php setlocal commentstring=//%s
    autocmd TermOpen * setlocal nospell
augroup END
autocmd FileType php setlocal commentstring=//\ %s

"""""""""""""""""""""""""""""""""""""""""""

" Replace the word under the cursor
" Open a new command to complete with the word to substitute with
" Example:
" The cursor is on the word "foo".
" Hitting <leader>s will open ":%s/foo/"
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

""""""""""""""""""""""""""""""""""""""""""
" Personal
" """"""""

" Editing and sourcing $MYVIMRC fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>G
nnoremap <leader>cv :vsplit ~/.config/nvim/coc-settings.json<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Escape insert mode easier
inoremap jk <esc>:update<cr>
" NOTE: This makes it too complicated to navigate in visual mode
" vnoremap jk <esc>:update<cr>
nnoremap <leader>ss <esc>:update<cr>

nnoremap ;; A;<esc>
nnoremap ,, A,<esc>
nnoremap <leader>dj yyp

nnoremap <leader>kk :nohlsearch<cr>
nnoremap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Search the selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

vnoremap < <gv
vnoremap > >gv
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" nnoremap <leader>b :buffers<cr>:buffer<space>

" {{{{{{{{{{{{{{{{{{{
" t.ly/whw5
nnoremap <leader>ltab :tablast<cr>
nnoremap <leader>ftab :tabfirst<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
nnoremap <c-j> ddp
nnoremap <c-k> dd<esc>kP
" Suggested by vim.fandom, it must be better 🤔
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" Remove current file
" nnoremap <leader>rm :call delete(expand('%')) | bdelete!
" }}}}}}}}}}}}}}}}}}}

" Some php abbreviations
iabbrev cls class
iabbrev impl implements
iabbrev rfoundation Symfony\Component\HttpFoundation\

iabbrev prifunc private function
iabbrev profunc protected function
iabbrev pubfunc public function

iabbrev prisfunc private static function
iabbrev prosfunc protected static function
iabbrev pubsfunc public static function

iabbrev try try {
            \<CR>
            \} catch (\Throwable $e) {
            \<CR>}

iabbrev __construct public function __construct() 
            \<CR>{
            \<CR>}

" {{{{{{{{{{{{{{{{{{{
" Integrate fd command
function! ExtractStringFromLine()
endfunction

function! FastFindFile(filename, path)
    let fd_result = system('! fd -i ' . a:filename . ' ' . a:path)
    let size = split(fd_result, '\v\n')

    " Open a new split and set it up.
    split __fd_result__
    normal! ggdG
    setlocal buftype=nofile
    setlocal nowrap
    setlocal norelativenumber
    setlocal number
    nnoremap <buffer> q :bdelete<cr>
    nnoremap <buffer> <silent> <cr> :execute 'tabnew '.getline('.')<cr>

    " Insert the bytecode.
    call append(0, size)

    setlocal readonly
    " Cannot work ever since you do many researches
    " setlocal nomodifiable
    normal! gg
    resize 10
endfunction

nnoremap <leader>fd :call FastFindFile(expand('<cword>'), 'src')<cr>
nnoremap <leader>efd :call FastFindFile(expand('<cword>'), '.')<cr>
" vnoremap <leader>fd :call FastFindFile(expand('<cword>'))<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" Update selected composer package
function! UpdateComposer(rawPackageName)
    let packageName = substitute(a:rawPackageName, '"', '', 'g')
    let packageName = split(trim(packageName), ':')[0]

    " NOTE testing this
    " FloatermNew --autoclose=0 docker-compose exec -T php composer u ' . packageName
    " This used to work
    execute '! docker-compose exec -T php composer u ' . packageName
    " let bytecode = system('docker-compose exec php composer u ' . packageName . ' -vvv')
endfunction

nnoremap <leader>com :call UpdateComposer(getline('.'))<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" Update visual selected composer packages
function! s:ExtractComposerLine(composerLine)
    let packageName = substitute(a:composerLine, '"', '', 'g')
    let packageName = split(trim(packageName), ':')[0]

    return packageName
endfunction

function! VUpdateComposer(startNum, endNum)
    let start = a:startNum[1]
    let end = a:endNum[1]
    let packages = []

    while start < end
        let packageName = s:ExtractComposerLine(getline(start))
        call add(packages, packageName)

        let start += 1
    endwhile

    let joinedpackages = join(packages, ' ')

    let choice = confirm("Do you want to update '" . joinedpackages . "'?", "&Yes\n&No\n&Cancel", 2)
    if choice == 1
        " let bytecode = system('docker-compose exec php composer u ' . joinedpackages . ' -vvv')

        echo 'Updating... ======== ' . joinedpackages . ' ======== '

        call UpdateComposer(joinedpackages)
    else
        echo 'Cancelled "'. choice .'"'
    endif
endfunction

vnoremap <leader>vcom :<c-u>call VUpdateComposer(getpos("'<"), getpos("'>"))<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" Go to php method definition in the same file
" TODO not finished yet
nnoremap <leader>d :normal /function <cword>(<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" Rst plugin in the making
" TODO For now, it adds *** between the title
function! RstTitleTransform(titleText)
    let textLength = strlen(a:titleText)
    let titleMeta = repeat('*', textLength)

    exe "normal! O" . titleMeta . "\<Esc>"
    exe "normal! jo" . titleMeta . "\<Esc>k"
endfunction

nnoremap <leader>rt :<c-u>call RstTitleTransform(getline('.'))<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" Bug1: when the cursor is between two methods
function! DisplayFunctionName()
    let firstLine = 1
    let currentNumber = line('.')

    while currentNumber > firstLine
        let catchedLine = getline(currentNumber)
        let currentNumber = currentNumber - 1


        if catchedLine =~ '^ \+\(public\|private\|protected\) function '
            let functionName = substitute(catchedLine, '^ \+\(public\|private\|protected\) function ', '', 'g')
            echo functionName

            break
        endif
    endwhile
endfunction
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" TODO not finished yet
function! ReverseArgsOrder()
    let parenthesisContent = getline('.')
endfunction

" nnoremap <leader>rev :<c-u>call ReverseArgsOrder()<cr>
nnoremap <leader>rev :<c-u>call ReverseArgsOrder()<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" call Scratch()
nnoremap <leader>scr :<c-u>call Scratch()<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" Insert filename without the extension
function! InsertPhpClassLine()
    let filename = substitute(expand('%:t'), '.php', '', 'g')

    exe "normal! o\<esc>0ifinal class " . filename. "\<esc>"
endfunction

nnoremap <leader>cls :call InsertPhpClassLine()<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
" Run phpunit of the current word the cursor is on through --filter option
" function! PhpunitRun()
"     let word = expand("<cword>")

"     while start < end
"         let truc = s:ExtractComposerLine(getline(start))
"         call add(packages, truc)

"         let start += 1
"     endwhile

"     echo 'Updating... ' . join(packages, ' ')
"     call UpdateComposer(join(packages, ' '))


"     let fd_result = system('! fd ' . word . ' tests/Unit/')
"     let size = split(fd_result, '\v\n')

"     " Open a new split and set it up.
"     split __fd_result__
"     normal! ggdG
"     setlocal buftype=nofile
"     setlocal nowrap
"     setlocal norelativenumber
"     setlocal number
"     nnoremap <buffer> q :q<cr>
"     nnoremap <buffer> <silent> <cr> :execute 'tabnew '.getline('.')<cr>

"     " Insert the bytecode.
"     call append(0, size)

"     setlocal readonly
"     " Cannot work ever since you do many researches
"     " setlocal nomodifiable
"     normal! gg
"     resize 10
" endfunction

" vnoremap <leader>vcom :<c-u>call VUpdateComposer(getpos("'<"), getpos("'>"))<cr>
" }}}}}}}}}}}}}}}}}}}
"
" {{{{{{{{{{{{{{{{{{{
" Template for php
autocmd BufNewFile *.php 0r ~/.vim/templates/Skeleton.php

" Template for phpunit php
autocmd BufNewFile *Test.php 0r ~/.vim/templates/SkeletonTest.php

" Template for rst
autocmd BufNewFile *.rst 0r ~/.vim/templates/Skeleton.rst
" }}}}}}}}}}}}}}}}}}}

" Maintains undo history between sessions
" set undofile
