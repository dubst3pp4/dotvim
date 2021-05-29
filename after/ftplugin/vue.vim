" indenting
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" ALE
"
" use vls instead of tsserver to ensure correct linting of typescript in vue
" files, see
" https://github.com/dense-analysis/ale/issues/927#issuecomment-829533341
let b:ale_linters = ['eslint', 'vls']
let b:ale_fixers = ['eslint', 'vls']
