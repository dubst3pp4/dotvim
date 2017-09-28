"""""""""""""""
" B A S I C S "
"""""""""""""""
set nocompatible
set nu
syn on
filetype plugin indent on

"""""""""""""""""
" V I S U A L S "
"""""""""""""""""
set t_Co=256         " 256 colors in terminal
set background=dark
colorscheme molokai
set ruler            " show rows and column info
set showmode         " shows current mode
set ttyfast          " speedup in tty
set laststatus=2     " always show last status
set nowrap           " don't break long lines
set listchars=tab:▸\ 
set list
set hidden           " allow switch from modified buffer to another buffer

"""""""""""""""""""""
" I N D E N T I N G "
"""""""""""""""""""""
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""
" S E A R C H I N G "
"""""""""""""""""""""
set showmatch
set hlsearch
set ignorecase
set smartcase

"""""""""""""""""""""""""""""
" F I L E   B R O W S I N G "
"""""""""""""""""""""""""""""
set path+=**
set wildmenu

"""""""""""""""""""""""
" N A V I G A T I O N "
"""""""""""""""""""""""
let mapleader=","

" dont use the arrow keys ;-)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Definition of tag = Leader + #
nnoremap <Leader># <C-]>

"""""""""""""""""
" V A R I O U S "
"""""""""""""""""

" Speed up syntax highlighting
" see http://vim.wikia.com/wiki/Speed_up_Syntax_Highlighting
augroup vimrc
    autocmd!
    autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

" Simple TODO list:
" enter command Todo to list all files with TODOs or FIXMEs in quicklist
command! Todo noautocmd vimgrep /TODO\|FIXME/j % | cw
command! TodoR noautocmd vimgrep /TODO\|FIXME/j ** | cw

" when Quickfix is populated, open it
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END



"""""""""""""""""
" P L U G I N S "
"""""""""""""""""

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#fnamemod = ':t'

" Tagbar
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_type_freepascal = {
    \ 'ctagstype' : 'freepascal',
    \ 'kinds'     : [
        \ 't:Type',
        \ 'c:Class',
        \ 'n:Constructor',
        \ 'd:Destructor',
        \ 'm:Method',
        \ 'f:Function',
        \ 'p:Procedure',
        \ 's:Section',
    \ ],
\ }

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
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✘" 
let g:syntastic_warning_symbol = "⚠" 
let g:syntastic_style_error_symbol = "⮱"

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args='--report=csv --standard=PSR2'
let g:syntastic_freepascal_checkers = ['fpc']

" CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nmap <Leader>b :CtrlPBuffer<CR>

" NerdTree
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" SnipMate

"to prevent clash with youcompleteme, change snippet trigger to CTRL-SPACE
imap <C-SPACE> <esc>a<Plug>snipMateNextOrTrigger
smap <C-SPACE> <Plug>snipMateNextOrTrigger
