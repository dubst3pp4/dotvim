setlocal omnifunc=phpcomplete#CompletePHP

" old indenting of case constructs
let g:PHP_vintage_case_default_indent = 1

" command fmt to format buffer with phpcbf
command! -buffer -range=% Fmt let myview = winsaveview() |
  \ execute <line1> . "," . <line2> . "!phpcbf --standard=PSR2" |
  \ call winrestview(myview)

" do not match < and > (which are used in => and ->)
setlocal matchpairs-=<:>
