command! MakeTags !find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | LANG=C sort > tags

" indenting
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" folding
setlocal foldmethod=syntax
let javaScript_fold=1 " enable folding in js files

" JSDoc support
let g:javascript_plugin_jsdoc = 1

" ALE
let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']
