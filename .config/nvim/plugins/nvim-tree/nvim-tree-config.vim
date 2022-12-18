let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }
" let g:nvim_tree_icons = {
"     \ 'default': "",
"     \ 'symlink': "",
"     \ 'git': {
"     \   'unstaged': "✗",
"     \   'staged': "✓",
"     \   'unmerged': "",
"     \   'renamed': "➜",
"     \   'untracked': "★",
"     \   'deleted': "",
"     \   'ignored': "◌"
"     \   },
"     \ 'folder': {
"     \   'arrow_open': "",
"     \   'arrow_closed': "",
"     \   'default': "",
"     \   'open': "",
"     \   'empty': "",
"     \   'empty_open': "",
"     \   'symlink': "",
"     \   'symlink_open': "",
"     \   }
"     \ }

nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


lua require'nvim-tree'.setup {}

" Default actions
" <CR> or o on the root folder will cd in the above directory
" <C-]> will cd in the directory under the cursor
" <BS> will close current opened directory or parent
" type a to add a file. Adding a directory requires leaving a leading / at the end of the path.
" you can add multiple directories by doing foo/bar/baz/f and it will add foo bar and baz directories and f as a file

" type r to rename a file
" type <C-r> to rename a file and omit the filename on input
" type x to add/remove file/directory to cut clipboard
" type c to add/remove file/directory to copy clipboard
" type y will copy name to system clipboard
" type Y will copy relative path to system clipboard
" type gy will copy absolute path to system clipboard
" type p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
" type d to delete a file (will prompt for confirmation)
" type D to trash a file (configured in setup())
" type ]c to go to next git item
" type [c to go to prev git item
" type - to navigate up to the parent directory of the current file/directory
" type s to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see :h nvim-tree.setup under system_open)
" if the file is a directory, <CR> will open the directory otherwise it will open the file in the buffer near the tree
" if the file is a symlink, <CR> will follow the symlink (if the target is a file)
" <C-v> will open the file in a vertical split
" <C-x> will open the file in a horizontal split
" <C-t> will open the file in a new tab
" <Tab> will open the file as a preview (keeps the cursor in the tree)
" I will toggle visibility of hidden folders / files
" H will toggle visibility of dotfiles (files/folders starting with a .)
" R will refresh the tree
" Double left click acts like <CR>
" Double right click acts like <C-]>
" W will collapse the whole tree
" S will prompt the user to enter a path and then expands the tree to match the path
" . will enter vim command mode with the file the cursor is on
" C-k will toggle a popup with file infos about the file under the cursor
