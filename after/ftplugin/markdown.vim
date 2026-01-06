" Visual
setlocal list
setlocal wrap
setlocal linebreak
setlocal breakindent
setlocal showbreak=↪
setlocal nonumber
" Indentation
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
" Markdown specific settings
setlocal spell spelllang=de_de,en
setlocal conceallevel=2
setlocal foldlevel=99
" vim-markdown related
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_folding_style_pythonic = 1
" Mappings
inoremap <buffer> <Tab> <C-t>
inoremap <buffer> <S-Tab> <C-d>

" Wiki / Workflow
" allow to press gf on internal links
setlocal includeexpr=substitute(v:fname,'^\[\|\]$','','g')
" extend the search path to my Wiki directory
setlocal path+=~/Dokumente/Wiki/**
" allow to follow links without the .md and .txt suffix
setlocal suffixesadd=.md,.txt
