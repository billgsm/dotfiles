call plug#begin('~/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'evidens/vim-twig'
" Make vim pretty with nova-vim
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdtree'
Plug 'bfredl/nvim-miniyank'
Plug 'moll/vim-bbye'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'amiorin/vim-project'
Plug 'mhinz/vim-startify' " php project management but quite complicated
Plug 'StanAngeloff/php.vim' " php syntax but complicated
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'elythyr/phpactor-mappings'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'neomake/neomake'
Plug 'adoy/vim-php-refactoring-toolbox' " shortcuts don't work yet
Plug 'mhinz/vim-signify'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'vim-vdebug/vdebug' " Project path needs to be specified https://bit.ly/35ll1N1
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bilougit/phpunit.vim'
Plug 'ryanoasis/vim-devicons' " Should be loaded last
call plug#end()

" Plugins configurations
" """"""""""""""""""""""
"
" NERDTree
" """"""""
" How can I map a specific key or shortcut to open NERDTree?
nmap nt :NERDTreeToggle<CR>
nmap nf :NERDTreeFind<CR>
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Lightline.vim
" """""""""""""
set laststatus=2

" vim-commentary
" """"""""""""""
" gcc to comment a line
" gcj to comment the current and the line below
" gc4j to comment the current and four lines below

" tpope/vim-abolish
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

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" phpactor/ncm2-phpactor
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect

" ripgrep
nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

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
set tags+=.git/tags
" Generates php ctags on save
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" ctrlp.vim
" """""""""
" This is copied from a blog and I'm not sure all
" of the setups below are working.
"
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

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

" ctrlp.vim with ctags
nnoremap <leader-o> :CtrlPTag<CR>

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

"""""""""""""""""""""""""""""""""""""""""""

if !has('gui_running')
  set t_Co=256
endif

" My own config
" """""""""""""
" show existing tab with 4 spaces width
set tabstop=4

" soft tab width
set softtabstop=4
set shiftwidth=4

" 4 spaces tab
set expandtab

" numbered lines
set nu

" backup vim
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Highlight search
set hls

" Switch leader from \ to space
let mapleader = ","
