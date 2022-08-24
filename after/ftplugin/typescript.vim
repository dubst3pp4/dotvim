" indenting
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" ALE
let b:ale_linters = ['eslint', 'tsserver']
let b:ale_fixers = ['eslint']
" Use folding infos from lsp
setlocal foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
