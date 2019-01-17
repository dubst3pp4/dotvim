setlocal omnifunc=phpcomplete#CompletePHP

" old indenting of case constructs
let g:PHP_vintage_case_default_indent = 1

" command fmt to format buffer with phpcbf
command! -buffer -range=% Fmt let myview = winsaveview() |
  \ execute <line1> . "," . <line2> . "!phpcbf --standard=PSR2" |
  \ call winrestview(myview)

" do not match < and > (which are used in => and ->)
setlocal matchpairs-=<:>

" enable folding
setlocal foldmethod=syntax
setlocal foldcolumn=1 " show fold gutter
setlocal foldlevelstart=99 " open with all folds opened
let php_folding=1 " enable folding in js files
