" indenting
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" Ale
let b:ale_linter_aliases = ['html']
let b:ale_linters = ['vscodehtml', 'eslint', 'djlint']
let b:ale_fixers = ['djlint']
