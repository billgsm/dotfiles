if exists('g:no_vim_conceal') || !has('conceal') || &enc != 'utf-8'
  finish
endif

" comparators
syntax match phpOperator "<=" conceal cchar=≤
syntax match phpOperator ">=" conceal cchar=≥
syntax match phpOperator "!=" conceal cchar=≠
syntax match phpOperator "==" conceal cchar=≃
syntax match phpOperator "!==" conceal cchar=≢
syntax match phpOperator "===" conceal cchar=≡

syntax match phpOperator "->" conceal cchar=→
syntax match phpOperator "=>" conceal cchar=⇒

" math related
syntax match phpOperator " / " conceal cchar=÷
syntax match phpOperator " \* " conceal cchar=×
syntax match phpOperator " \*\* " conceal cchar=ʌ
syntax match phpOperator "++" conceal cchar=⧺
" syntax match phpOperator "\<\%(math\.\)\?sqrt\>" conceal cchar=√
" syntax match phpOperator "\<\%(math\.\)\?prod\>" conceal cchar=∏
" syntax match phpOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
" syntax match phpOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
" syntax match pyKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π

" keywords
" syntax keyword phpOperator product conceal cchar=∏
" syntax keyword phpOperator sum conceal cchar=∑
" syntax keyword pyStatement lambda conceal cchar=λ

hi link phpOperator Operator
" hi link pyStatement Statement
" hi link pyKeyword Keyword
hi! link Conceal Operator

hi conceal ctermfg=DarkBlue ctermbg=none guifg=DarkBlue guibg=none

setlocal conceallevel=1 concealcursor=nvic

