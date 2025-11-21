set list
set wrap
set linebreak
set breakindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
setlocal nonumber
setlocal spell spelllang=de_de,en
" enable concealing for markdown
setlocal conceallevel=2
" don't indent a newline when pressing o on a list item
let g:vim_markdown_new_list_item_indent = 0

" allow to press gf on internal links
setlocal includeexpr=substitute(v:fname,'^\[\|\]$','','g')
" extend the search path to my Wiki directory
setlocal path+=~/Dokumente/Wiki/**
" allow to follow links without the .md and .txt suffix
setlocal suffixesadd=.md,.txt
