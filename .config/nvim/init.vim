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

" to have the file path at the top right of the screen
set winbar=%=%m\ %f

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

source ~/.config/nvim/plugins/vim-fugitive/vim-fugitive.vim
source ~/.config/nvim/plugins/nerdtree/nerdtree.vim
" source ~/.config/nvim/plugins/nvim-tree/nvim-tree.vim
source ~/.config/nvim/plugins/dispatch/dispatch.vim
source ~/.config/nvim/plugins/fzf/fzf.vim
source ~/.config/nvim/plugins/floaterm/floaterm.vim
" source ~/.config/nvim/plugins/dracula/dracula.vim
" source ~/.config/nvim/plugins/codedark/codedark.vim
" source ~/.config/nvim/plugins/phptheme/phptheme.vim
" source ~/.config/nvim/plugins/janah/janah.vim
source ~/.config/nvim/plugins/onedark/onedark.vim
" source ~/.config/nvim/plugins/lsp/lsp.vim
source ~/.config/nvim/plugins/coc/coc.vim
source ~/.config/nvim/plugins/phpactor/phpactor.vim
source ~/.config/nvim/plugins/vim-test/vim-test.vim
source ~/.config/nvim/plugins/sideways/sideways.vim
source ~/.config/nvim/plugins/lightline/lightline.vim
source ~/.config/nvim/plugins/vim-fetch/vim-fetch.vim
source ~/.config/nvim/plugins/interestingwords/interestingwords.vim
source ~/.config/nvim/plugins/cucumber/cucumber.vim
source ~/.config/nvim/plugins/tabular/tabular.vim
source ~/.config/nvim/plugins/surround/surround.vim
source ~/.config/nvim/plugins/repeat/repeat.vim
source ~/.config/nvim/plugins/speeddating/speeddating.vim
source ~/.config/nvim/plugins/unimpaired/unimpaired.vim
source ~/.config/nvim/plugins/commentary/commentary.vim
source ~/.config/nvim/plugins/abolish/abolish.vim
source ~/.config/nvim/plugins/vim-sensible/vim-sensible.vim
source ~/.config/nvim/plugins/syntastic/syntastic.vim
source ~/.config/nvim/plugins/tmux/tmux.vim
source ~/.config/nvim/plugins/vtr/vtr.vim
source ~/.config/nvim/plugins/polyglot/polyglot.vim
source ~/.config/nvim/plugins/basicscratch/basicscratch.vim
source ~/.config/nvim/plugins/quickscope/quickscope.vim
source ~/.config/nvim/plugins/autopairs/autopairs.vim
source ~/.config/nvim/plugins/twig/twig.vim
source ~/.config/nvim/plugins/ansible/ansible.vim
source ~/.config/nvim/plugins/bbye/bbye.vim
source ~/.config/nvim/plugins/plantuml/plantuml.vim
source ~/.config/nvim/plugins/ferret/ferret.vim
source ~/.config/nvim/plugins/signify/signify.vim
source ~/.config/nvim/plugins/vdebug/vdebug.vim
source ~/.config/nvim/plugins/editorconfig/editorconfig.vim
source ~/.config/nvim/plugins/mundo/mundo.vim
source ~/.config/nvim/plugins/neomake/neomake.vim
source ~/.config/nvim/plugins/telescope/telescope.vim
source ~/.config/nvim/plugins/splitjoin/splitjoin.vim
source ~/.config/nvim/plugins/context-commentstring/context-commentstring.vim
source ~/.config/nvim/plugins/dockerfile/dockerfile.vim
source ~/.config/nvim/plugins/asyncrun/asyncrun.vim
source ~/.config/nvim/plugins/makegreen/makegreen.vim
source ~/.config/nvim/plugins/projectionist/projectionist.vim
source ~/.config/nvim/plugins/eunuch/eunuch.vim
source ~/.config/nvim/plugins/startify/startify.vim
source ~/.config/nvim/plugins/obsession/obsession.vim
source ~/.config/nvim/plugins/easymotion/easymotion.vim
source ~/.config/nvim/plugins/rfc/rfc.vim
source ~/.config/nvim/plugins/copilot/copilot.vim

call plug#end()
doautocmd User PlugLoaded

"------------------------------------------------------------------------------
" Miscellaneous
"------------------------------------------------------------------------------

source ~/.config/nvim/plugins/vim-fugitive/vim-fugitive-config.vim
source ~/.config/nvim/plugins/nerdtree/nerdtree-config.vim
" source ~/.config/nvim/plugins/nvim-tree/nvim-tree-config.vim
source ~/.config/nvim/plugins/dispatch/dispatch-config.vim
source ~/.config/nvim/plugins/fzf/fzf-config.vim
source ~/.config/nvim/plugins/floaterm/floaterm-config.vim
" source ~/.config/nvim/plugins/dracula/dracula-config.vim
" source ~/.config/nvim/plugins/codedark/codedark-config.vim
" source ~/.config/nvim/plugins/phptheme/phptheme-config.vim
" source ~/.config/nvim/plugins/janah/janah-config.vim
source ~/.config/nvim/plugins/onedark/onedark-config.vim
" source ~/.config/nvim/plugins/lsp/lsp-config.vim
source ~/.config/nvim/plugins/coc/coc-config.vim
source ~/.config/nvim/plugins/phpactor/phpactor-config.vim
source ~/.config/nvim/plugins/vim-test/vim-test-config.vim
source ~/.config/nvim/plugins/sideways/sideways-config.vim
source ~/.config/nvim/plugins/lightline/lightline-config.vim
source ~/.config/nvim/plugins/vim-fetch/vim-fetch-config.vim
source ~/.config/nvim/plugins/interestingwords/interestingwords-config.vim
source ~/.config/nvim/plugins/cucumber/cucumber-config.vim
source ~/.config/nvim/plugins/tabular/tabular-config.vim
source ~/.config/nvim/plugins/surround/surround-config.vim
source ~/.config/nvim/plugins/repeat/repeat-config.vim
source ~/.config/nvim/plugins/speeddating/speeddating-config.vim
source ~/.config/nvim/plugins/unimpaired/unimpaired-config.vim
source ~/.config/nvim/plugins/commentary/commentary-config.vim
source ~/.config/nvim/plugins/abolish/abolish-config.vim
source ~/.config/nvim/plugins/vim-sensible/vim-sensible-config.vim
source ~/.config/nvim/plugins/syntastic/syntastic-config.vim
source ~/.config/nvim/plugins/tmux/tmux-config.vim
source ~/.config/nvim/plugins/vtr/vtr-config.vim
source ~/.config/nvim/plugins/polyglot/polyglot-config.vim
source ~/.config/nvim/plugins/basicscratch/basicscratch-config.vim
source ~/.config/nvim/plugins/quickscope/quickscope-config.vim
source ~/.config/nvim/plugins/autopairs/autopairs-config.vim
source ~/.config/nvim/plugins/twig/twig-config.vim
source ~/.config/nvim/plugins/ansible/ansible-config.vim
source ~/.config/nvim/plugins/bbye/bbye-config.vim
source ~/.config/nvim/plugins/plantuml/plantuml-config.vim
source ~/.config/nvim/plugins/ferret/ferret-config.vim
source ~/.config/nvim/plugins/signify/signify-config.vim
source ~/.config/nvim/plugins/vdebug/vdebug-config.vim
source ~/.config/nvim/plugins/editorconfig/editorconfig-config.vim
source ~/.config/nvim/plugins/mundo/mundo-config.vim
source ~/.config/nvim/plugins/neomake/neomake-config.vim
source ~/.config/nvim/plugins/telescope/telescope-config.vim
source ~/.config/nvim/plugins/splitjoin/splitjoin-config.vim
source ~/.config/nvim/plugins/context-commentstring/context-commentstring-config.vim
source ~/.config/nvim/plugins/dockerfile/dockerfile-config.vim
source ~/.config/nvim/plugins/asyncrun/asyncrun-config.vim
source ~/.config/nvim/plugins/makegreen/makegreen-config.vim
source ~/.config/nvim/plugins/projectionist/projectionist-config.vim
source ~/.config/nvim/plugins/eunuch/eunuch-config.vim
source ~/.config/nvim/plugins/startify/startify-config.vim
source ~/.config/nvim/plugins/obsession/obsession-config.vim
source ~/.config/nvim/plugins/easymotion/easymotion-config.vim
source ~/.config/nvim/plugins/rfc/rfc-config.vim
source ~/.config/nvim/plugins/copilot/copilot-config.vim
"""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------------------------------------
" Well arranged customs
"------------------------------------------------------------------------------

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
nnoremap <leader>ev :tabnew $MYVIMRC<cr>G
nnoremap <leader>cv :tabnew ~/.config/nvim/coc-settings.json<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Escape insert mode easier
inoremap jk <esc>:update<cr>
" NOTE: This makes it too complicated to navigate in visual mode
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

" {{{{{{{{{{{{{{{{{{{
" t.ly/whw5
nnoremap <leader>ltab :tablast<cr>
nnoremap <leader>ftab :tabfirst<cr>
" }}}}}}}}}}}}}}}}}}}

" {{{{{{{{{{{{{{{{{{{
nnoremap <c-j> ddp
nnoremap <c-k> dd<esc>kP
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
