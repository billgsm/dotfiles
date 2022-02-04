call plug#begin('~/nvim/plugged')
"==============================================================================

Plug 'tpope/vim-fugitive'
Plug 'evidens/vim-twig'
" Make vim pretty with nova-vim
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
" Slows down vim 😥
" Plug 'Xuyuanp/nerdtree-git-plugin'
" """"""""""""""""""""""""""""""""""
" """"""""""""""""""""""""""""""""""
" Erreur détectée en traitant function miniyank#on_yank[14]..miniyank#write :
" Retry to install this later
" Plug 'bfredl/nvim-miniyank'
Plug 'moll/vim-bbye'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'amiorin/vim-project'
Plug 'mhinz/vim-startify' " php project management but quite complicated
"Plug 'StanAngeloff/php.vim' " php syntax but complicated
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'elythyr/phpactor-mappings'

" Syntax highlighter
Plug 'vim-syntastic/syntastic'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Manage tags files (for ctags) ?
" Plug 'ludovicchabant/vim-gutentags'

" Plantuml
Plug 'aklt/plantuml-syntax'

" Basic autocomplete
Plug 'shawncplus/phpcomplete.vim'

Plug 'wincent/ferret'
" Plug 'neomake/neomake'
Plug 'adoy/vim-php-refactoring-toolbox' " shortcuts don't work yet
Plug 'mhinz/vim-signify'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'vim-vdebug/vdebug' " Project path needs to be specified https://bit.ly/35ll1N1
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons' " Should be loaded last

" Best autocomplete tool ever
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Json with comments
Plug 'kevinoid/vim-jsonc'

" Nice plugins
""""""""""""""

Plug 'editorconfig/editorconfig-vim'

" {{{
Plug 'jiangmiao/auto-pairs'
" }}}

" {{{
Plug 'junegunn/limelight.vim'

" Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 245

" Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
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

" Close brakets with Enter touch
" Plug 'mapkts/enwise'

" Scratch
Plug 'bilougit/basicscratch'

"==============================================================================
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""

" General setup
if !has('gui_running')
  set t_Co=256
endif

" My own config
" """""""""""""
syntax on
" show existing tab with 4 spaces width
set tabstop=4

" soft tab width
set softtabstop=4
set shiftwidth=4

" 4 spaces tab
set expandtab

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
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

" Highlight search
set hls

" Switch leader from \ to space
let mapleader = ","

" reload files when they change on disk (e.g., git checkout)
set autoread

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
" NERDTree
" """"""""
" How can I map a specific key or shortcut to open NERDTree?
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>ff :NERDTreeFind<CR>

" How to edit the width of NERDTree window
let g:NERDTreeWinSize = 50

" How to hide the boring brackets([ ])?
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" }}}

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

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" phpactor/ncm2-phpactor
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect

" ripgrep
nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

" fzf
  " \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow -g "!.git/*" -g "!tags*" -g "!*.xml" -g "!var/**" -g "!infection/*" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" let g:fzf_tags_command = 'ctags -R' " this is the default value
" let g:fzf_tags_command = '.git/hooks/ctags'

" neomake
" When writing a buffer (no delay).
" call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
" call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

" vim-php-refactoring-toolbox
" nmap <C-M-o> :call PhpDetectUnusedUseStatements()<CR> " Does not work

" vim-signify
set updatetime=100

" tagbar
nmap <F8> :TagbarToggle<CR>

" CTAGS
"
" :ts or :tselect shows the list
" :tn or :tnext goes to the next tag in that list
" :tp or :tprev goes to the previous tag in that list
" :tf or :tfirst goes to the first tag of the list
" :tl or :tlast goes to the last tag of the list
"
" generated file can be under .git folder too
" set tags+=.git/tags
" Generates php ctags on save
" au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
set tags=tags

" ctrlp.vim with ctags
nnoremap <leader>oo :CtrlPTag<CR>

" ctrlp.vim
" """""""""
" This is copied from a blog and I'm not sure all
" of the setups below are working.
"
" Setup some default ignores
  "\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v(\.(exe|so|dll|class|png|jpg|jpeg)|c?tags(\.(temp|lock))?)$',
\}

let g:ctrlp_user_command = 'find %s -type f'

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
" If a file is already open, open it again in a new pane instead of switching to the existing pane
let g:ctrlp_switch_buffer = 'et'

" vim-unimpaired
nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]

" vim-devicons 
set encoding=UTF-8

" phpunit.vim
let g:php_bin = 'docker-compose exec -T -u root php php'
let g:phpunit_bin = 'vendor/bin/phpunit'
let g:phpunit_testroot = 'tests/unit'

" coc.nvim
""""""""""""""""""
""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""
""""""""""""""""""

" Personal
" """"""""

" Editing and sourcing $MYVIMRC fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>G
nnoremap <leader>sv :source $MYVIMRC<cr>

" Escape insert mode easier
inoremap jk <esc>:update<cr>

" shortcut for :Buffers
nnoremap <leader>buf :Buffers<cr>

" shortcut for :GitFiles
nnoremap <leader><leader> :GitFiles<cr>

" Search for visual-seleced text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Search the selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

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
