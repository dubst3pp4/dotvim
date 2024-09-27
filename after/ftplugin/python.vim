" always indent PEP8 style
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
" no need to use flake8 as pylsp supports flake8 already (see below)
let b:ale_linters = ['pylsp']
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
let b:ale_python_pylsp_use_global = 1
" tell pylsp to use flake8 for linting
" see https://github.com/python-lsp/python-lsp-server#configuration
let b:ale_python_pylsp_config = {
            \   'pylsp': {
            \     'plugins': {
            \       'flake8': {
            \         'enabled': v:true
            \       },
            \       'pycodestyle': {
            \         'enabled': v:false
            \       },
            \       'mccabe': {
            \         'enabled': v:false
            \       },
            \       'pyflakes': {
            \         'enabled': v:false
            \       },
            \     }, 
            \    'configurationSources': ['flake8']
            \   },
            \ }
