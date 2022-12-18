" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files prompt_prefix=🔍<cr>
nnoremap <leader>fg <cmd>Telescope live_grep prompt_prefix=🔍<cr>
nnoremap <leader>fgb <cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>
nnoremap <leader>fb <cmd>Telescope buffers prompt_prefix=🔍<cr>
nnoremap <leader>fh <cmd>Telescope help_tags prompt_prefix=🔍<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find prompt_prefix=🔍<cr>
nnoremap <leader>fsh <cmd>Telescope search_history prompt_prefix=🔍<cr>
nnoremap <leader>fbr <cmd>Telescope git_branches prompt_prefix=🔍<cr>
nnoremap <leader>fts <cmd>Telescope treesitter prompt_prefix=🔍<cr>
