let b:ale_linters = ['pyls', 'flake8']
let b:ale_fixers = ['autopep8']
let b:ale_python_auto_pipenv = 1
let b:ale_python_flake8_auto_pipenv = 1
let b:ale_python_pyls_auto_pipenv = 1
" Use folding infos from lsp
setlocal foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
