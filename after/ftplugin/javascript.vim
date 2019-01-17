command! MakeTags !find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | LANG=C sort > tags

" folding
setlocal foldmethod=syntax
setlocal foldcolumn=1 " show fold gutter
setlocal foldlevelstart=99 " open with all folds opened
let javaScript_fold=1 " enable folding in js files

" JSDoc support
let g:javascript_plugin_jsdoc = 1
