call plug#begin('~/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'evidens/vim-twig'
" Make vim pretty with nova-vim
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'pearofducks/ansible-vim'
Plug 'preservim/nerdtree'
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
Plug 'StanAngeloff/php.vim' " php syntax but complicated
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'elythyr/phpactor-mappings'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Manage tags files (for ctags) ?
Plug 'ludovicchabant/vim-gutentags'

" Basic autocomplete
Plug 'shawncplus/phpcomplete.vim'

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

" Nice plugins
""""""""""""""

Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
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
set nu

set colorcolumn=80,120

" backup vim
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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
" NERDTree
" """"""""
" How can I map a specific key or shortcut to open NERDTree?
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
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

  " \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!tags*" --glob "!*.xml" --glob "!*.cache" --glob "!infection/*" --color "always" '.shellescape(<q-args>), 1,
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
" au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" ctrlp.vim with ctags
nnoremap <leader-o> :CtrlPTag<CR>

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

" Personal
" """"""""
" Welcoming message
echo "---------------------------------------------------------------------"
echo "|                            Example tips                           |"
echo "---------------------------------------------------------------------"
echo "ysiw'           => surround the current word with simple quote"
echo "da[             => same as di[ except it deletes bracket too"
echo "dt<space>       => same as df<space> except it won't delete the space"
echo ":earlier 2m     => gets 2 minutes back to the file version"
echo "           ================="
echo "             FINDING FILES"
echo "           ================="
echo "\" Searches down into subfolders"
echo "\" Provides tab-completion for all file-related tasks"
echo ":set path+=**"
echo "\" Displays all matching files when we tab complete"
echo ":set wildmenu"
echo "\" Autocompletes any open buffer"
echo ":b <some characters>"
echo "\" ctags moment"
echo "ctags -R . \" this will generate tags"
echo "<C-$> will go to the definition of the word you're on"
echo "<C-t> will go back to the previous tag you were on"

" echo "                                                                                                                                                                                      dddddddd"
" echo "EEEEEEEEEEEEEEEEEEEEEE                   jjjj                                                   &&&&&&&&&&                 GGGGGGGGGGGGG                                              d::::::d"
" echo "E::::::::::::::::::::E                  j::::j                                                 &::::::::::&             GGG::::::::::::G                                              d::::::d"
" echo "E::::::::::::::::::::E                   jjjj                                                 &::::&&&:::::&          GG:::::::::::::::G                                              d::::::d"
" echo "EE::::::EEEEEEEEE::::E                                                                       &::::&   &::::&         G:::::GGGGGGGG::::G                                              d:::::d "
" echo "  E:::::E       EEEEEEnnnn  nnnnnnnn   jjjjjjj   ooooooooooo yyyyyyy           yyyyyyy       &::::&   &::::&        G:::::G       GGGGGG   ooooooooooo      ooooooooooo       ddddddddd:::::d "
" echo "  E:::::E             n:::nn::::::::nn j:::::j oo:::::::::::ooy:::::y         y:::::y         &::::&&&::::&        G:::::G               oo:::::::::::oo  oo:::::::::::oo   dd::::::::::::::d "
" echo "  E::::::EEEEEEEEEE   n::::::::::::::nn j::::jo:::::::::::::::oy:::::y       y:::::y          &::::::::::&         G:::::G              o:::::::::::::::oo:::::::::::::::o d::::::::::::::::d "
" echo "  E:::::::::::::::E   nn:::::::::::::::nj::::jo:::::ooooo:::::o y:::::y     y:::::y            &:::::::&&          G:::::G    GGGGGGGGGGo:::::ooooo:::::oo:::::ooooo:::::od:::::::ddddd:::::d "
" echo "  E:::::::::::::::E     n:::::nnnn:::::nj::::jo::::o     o::::o  y:::::y   y:::::y           &::::::::&   &&&&     G:::::G    G::::::::Go::::o     o::::oo::::o     o::::od::::::d    d:::::d "
" echo "  E::::::EEEEEEEEEE     n::::n    n::::nj::::jo::::o     o::::o   y:::::y y:::::y           &:::::&&::&  &:::&     G:::::G    GGGGG::::Go::::o     o::::oo::::o     o::::od:::::d     d:::::d "
" echo "  E:::::E               n::::n    n::::nj::::jo::::o     o::::o    y:::::y:::::y           &:::::&  &::&&:::&&     G:::::G        G::::Go::::o     o::::oo::::o     o::::od:::::d     d:::::d "
" echo "  E:::::E       EEEEEE  n::::n    n::::nj::::jo::::o     o::::o     y:::::::::y            &:::::&   &:::::&        G:::::G       G::::Go::::o     o::::oo::::o     o::::od:::::d     d:::::d "
" echo "EE::::::EEEEEEEE:::::E  n::::n    n::::nj::::jo:::::ooooo:::::o      y:::::::y             &:::::&    &::::&         G:::::GGGGGGGG::::Go:::::ooooo:::::oo:::::ooooo:::::od::::::ddddd::::::dd"
" echo "E::::::::::::::::::::E  n::::n    n::::nj::::jo:::::::::::::::o       y:::::y              &::::::&&&&::::::&&        GG:::::::::::::::Go:::::::::::::::oo:::::::::::::::o d:::::::::::::::::d"
" echo "E::::::::::::::::::::E  n::::n    n::::nj::::j oo:::::::::::oo       y:::::y                &&::::::::&&&::::&          GGG::::::GGG:::G oo:::::::::::oo  oo:::::::::::oo   d:::::::::ddd::::d"
" echo "EEEEEEEEEEEEEEEEEEEEEE  nnnnnn    nnnnnnj::::j   ooooooooooo        y:::::y                   &&&&&&&&   &&&&&             GGGGGG   GGGG   ooooooooooo      ooooooooooo      ddddddddd   ddddd"
" echo "                                        j::::j                     y:::::y                                                                                                                    "
" echo "                              jjjj      j::::j                    y:::::y                                                                                                                     "
" echo "                             j::::jj   j:::::j                   y:::::y                                                                                                                      "
" echo "                             j::::::jjj::::::j                  y:::::y                                                                                                                       "
" echo "                              jj::::::::::::j                  yyyyyyy                                                                                                                        "
" echo "                                jjj::::::jjj                                                                                                                                                  "
" echo "                                   jjjjjj                                                                                                                                                     "
" echo "                                                                                                                                                                                              "
" echo "                                                                                                                                                                                              "
" echo "lllllll                                       kkkkkkkk                 !!!                                                                                                                    "
" echo "l:::::l                                       k::::::k                !!:!!                                                                                                                   "
" echo "l:::::l                                       k::::::k                !:::!                                                                                                                   "
" echo "l:::::l                                       k::::::k                !:::!                                                                                                                   "
" echo " l::::l uuuuuu    uuuuuu      cccccccccccccccc k:::::k    kkkkkkk     !:::!                                                                                                                   "
" echo " l::::l u::::u    u::::u    cc:::::::::::::::c k:::::k   k:::::k      !:::!                                                                                                                   "
" echo " l::::l u::::u    u::::u   c:::::::::::::::::c k:::::k  k:::::k       !:::!                                                                                                                   "
" echo " l::::l u::::u    u::::u  c:::::::cccccc:::::c k:::::k k:::::k        !:::!                                                                                                                   "
" echo " l::::l u::::u    u::::u  c::::::c     ccccccc k::::::k:::::k         !:::!                                                                                                                   "
" echo " l::::l u::::u    u::::u  c:::::c              k:::::::::::k          !:::!                                                                                                                   "
" echo " l::::l u::::u    u::::u  c:::::c              k:::::::::::k          !!:!!                                                                                                                   "
" echo " l::::l u:::::uuuu:::::u  c::::::c     ccccccc k::::::k:::::k          !!!                                                                                                                    "
" echo "l::::::lu:::::::::::::::uuc:::::::cccccc:::::ck::::::k k:::::k                                                                                                                                "
" echo "l::::::l u:::::::::::::::u c:::::::::::::::::ck::::::k  k:::::k        !!!                                                                                                                    "
" echo "l::::::l  uu::::::::uu:::u  cc:::::::::::::::ck::::::k   k:::::k      !!:!!                                                                                                                   "
" echo "llllllll    uuuuuuuu  uuuu    cccccccccccccccckkkkkkkk    kkkkkkk      !!!                                                                                                                    "

" Editing and sourcing $MYVIMRC fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>G
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap jk <esc>

" Some php abbreviations
iabbrev cls class
iabbrev impl implements
iabbrev rfoundation Symfony\Component\HttpFoundation\
