" indenting
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" ALE
let b:ale_linter_aliases = {'vue': 'typescript'}
"let b:ale_linters = ['eslint', 'tsserver', 'vls']
let b:ale_linters = ['eslint', 'vls']
let b:ale_fixers = ['eslint', 'vls']
