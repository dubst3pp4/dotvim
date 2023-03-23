" indenting
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

" ALE
"
" vls is used via vim-lsp settings and vim-lsp-ale, so we just add eslint here
let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']
" Use folding infos from lsp
setlocal foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
