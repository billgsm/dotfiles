let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

" let g:NERDTreeDirArrowExpandable = '▹'
" let g:NERDTreeDirArrowCollapsible = '▿'
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>N :NERDTreeFind<CR>

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
let g:plug_window = 'noautocmd vertical topleft new'

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:NERDTreeWinSize = 50

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" ----------------------------------------------------------------------------
" nerdtree-git-plugin
" ----------------------------------------------------------------------------
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1
" let g:NERDTreeGitStatusShowClean = 1
