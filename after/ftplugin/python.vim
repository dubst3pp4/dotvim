let b:ale_linters = ['flake8']
let b:ale_fixers = ['black', 'isort']
let b:ale_python_auto_pipenv = 1
let b:ale_python_auto_poetry = 1
let b:ale_python_flake8_auto_pipenv = 1
let b:ale_python_flake8_auto_poetry = 1
let b:ale_python_black_auto_pipenv = 1
let b:ale_python_black_auto_poetry = 1
let b:ale_python_isort_auto_pipenv = 1
let b:ale_python_isort_auto_poetry = 1
let b:ale_fix_on_save = 0
" Use folding infos from lsp
setlocal foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
