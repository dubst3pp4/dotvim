" indenting
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" folding
setlocal foldmethod=syntax
setlocal foldcolumn=1
let javaScript_fold=1 " enable folding in js files

" JSDoc support
let g:javascript_plugin_jsdoc = 1

" ALE
let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']
