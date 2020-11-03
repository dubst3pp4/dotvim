" indenting
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" folding
setlocal foldmethod=syntax
setlocal foldcolumn=1

" ALE
let b:ale_linters = ['eslint', 'tsserver']
let b:ale_fixers = ['eslint']
