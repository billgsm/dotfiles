Plug 'vim-vdebug/vdebug'

" <F2>: step over
" <F3>: step into
" <F4>: step out
" <F5>: start/run (to next breakpoint/end of script)
" <F6>: stop debugging (kills script)
" <F7>: detach script from debugger
" <F9>: run to cursor
" <F10>: toggle line breakpoint
" <F11>: show context variables (e.g. after "eval")
" <F12>: evaluate variable under cursor
" :Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints)
" :VdebugEval <code>: evaluate some code and display the result
" <Leader>e: evaluate the expression under visual highlight and display the result

let g:vdebug_options = {
\    'port' : 9003,
\    'timeout' : 20,
\    'server' : '',
\    'on_close' : 'stop',
\    'break_on_open' : 0,
\    'ide_key' : '',
\    'debug_window_level' : 0,
\    'debug_file_level' : 0,
\    'debug_file' : '',
\    'path_maps' : {
\        <abspath-on-the-container>: getcwd(),
\    },
\    'watch_window_style' : 'expanded',
\    'marker_default' : '⬦',
\    'marker_closed_tree' : '▸',
\    'marker_open_tree' : '▾',
\    'sign_breakpoint' : '▷',
\    'sign_current' : '▶',
\    'continuous_mode'  : 1,
\    'simplified_status': 1,
\    'layout': 'vertical',
\}

let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F9>",
\    "step_over" : "<F2>",
\    "step_into" : "<F3>",
\    "step_out" : "<F4>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}

