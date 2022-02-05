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

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Allow more time for loading syntax on large files
set redrawtime=10000

set autoindent

" numbered lines
set relativenumber

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
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/phpactor.vim
source ~/.config/nvim/plugins/vim-test.vim

"==============================================================================

Plug 'evidens/vim-twig'
" Make vim pretty with nova-vim
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'pearofducks/ansible-vim'
Plug 'moll/vim-bbye'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'amiorin/vim-project'
" Syntax highlighter
Plug 'vim-syntastic/syntastic'

" Plantuml
Plug 'aklt/plantuml-syntax'

Plug 'wincent/ferret'
" Plug 'neomake/neomake'
Plug 'mhinz/vim-signify'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'vim-vdebug/vdebug' " Project path needs to be specified https://bit.ly/35ll1N1
Plug 'ryanoasis/vim-devicons' " Should be loaded last

" Json with comments
Plug 'kevinoid/vim-jsonc'

" Nice plugins
""""""""""""""

Plug 'editorconfig/editorconfig-vim'

" {{{
Plug 'jiangmiao/auto-pairs'
" }}}

" {{{
Plug 'AndrewRadev/sideways.vim'
" }}}

" {{{
" Leverage f and F
Plug 'unblevable/quick-scope'

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
" }}}

" vim-mundo history visualizer
" Plug 'simnalamburt/vim-mundo'


" {{{
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" }}}


" {{{
Plug 'dbeniamine/cheat.sh-vim'

" }}}


" {{{
Plug 'cometsong/CommentFrame.vim'

" }}}


" {{{
" vim path/to/file.txt:18:90 -> open the file on line 18 at column 90
Plug 'wsdjeg/vim-fetch'

" }}}


" Highlight different words using different colors
Plug 'lfv89/vim-interestingwords'

" {{{
" Alignment
Plug 'godlygeek/tabular'

" }}}

" {{{
" behat
Plug 'tpope/vim-cucumber'

" }}}

" {{{
" t o d o comments
Plug 'Dimercel/todo-vim'

" }}}

" Scratch
Plug 'bilougit/basicscratch'

"==============================================================================
call plug#end()
doautocmd User PlugLoaded

"""""""""""""""""""""""""""""""""""""""""""

" Replace the word under the cursor
" Open a new command to complete with the word to substitute with
" Example:
" The cursor is on the word "foo".
" Hitting <leader>s will open ":%s/foo/"
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

""""""""""""""""""""""""""""""""""""""""""

" Plugins configurations
" """"""""""""""""""""""
"
" {{{
" }}}

" Lightline.vim
" """""""""""""
set laststatus=2

" vim-commentary
" """"""""""""""
" gcc to comment a line
" gcj to comment the current and the line below
" gc4j to comment the current and four lines below

" tpope/vim-abolish
" """"""""""""""
" feat1
" :%Subvert/facilit{y,ies}/building{,s}/g  does the same as the three lines below
" :%s/facilities/buildings/g
" :%s/Facilities/Buildings/g
" :%s/FACILITIES/BUILDINGS/g
"
" feat2
" :Abolish that makes it easier than the native :iabbrev
"
" feat3
" Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
" MixedCase (crm),
" camelCase (crc),
" snake_case (crs),
" UPPER_CASE (cru),
" dash-case (cr-),
" dot.case (cr.),
" space case (cr<space>),
" and Title Case (crt) are all just 3 keystrokes away.
" """"""""""""""

" tagbar
nmap <F8> :TagbarToggle<CR>

" vim-unimpaired
nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]

""""""""""""""""""
""""""""""""""""""

" Personal
" """"""""

" Editing and sourcing $MYVIMRC fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>G
nnoremap <leader>sv :source $MYVIMRC<cr>

" Escape insert mode easier
inoremap jk <esc>:update<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

nmap <leader>k :nohlsearch<cr>

" Search the selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

vnoremap < <gv
vnoremap > >gv

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
" t.ly/whw5
nnoremap <leader>ltab :tablast<cr>
nnoremap <leader>ftab :tabfirst<cr>
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
