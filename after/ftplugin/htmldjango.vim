let b:ale_linter_aliases = ['html']
let b:ale_linters = ['vscodehtml']

" Use folding infos from lsp
setlocal foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
