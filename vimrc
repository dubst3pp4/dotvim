set nocompatible
colorscheme molokai

set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on



"""""""""""""""""
" P L U G I N S "
"""""""""""""""""

" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" Markdown
let g:vim_markdown_folding_disabled = 1

" Javascript
let g:javascript_plugin_jsdoc = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
