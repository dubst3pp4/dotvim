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
set lazyredraw       " speedup rendering while scrolling
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
" Press F2 to toggle highlighting on/off, and show current value.
noremap <F2> :set hlsearch! hlsearch?<CR>

"""""""""""""""""""""""""""""
" F I L E   B R O W S I N G "
"""""""""""""""""""""""""""""
set path+=**
set wildmenu

"""""""""""""""""""""""
" N A V I G A T I O N "
"""""""""""""""""""""""
let mapleader=","

" use the arrow keys to cycle through buffers
nnoremap <up> :blast<CR>
nnoremap <down> :bfirst<CR>
nnoremap <left> :bprevious<CR>
nnoremap <right> :bnext<CR>
nnoremap j gj
nnoremap k gk

" when opening a file, jump to last position ('.)
au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
   \ |   exe "normal! g`\""
   \ | endif


" Definition of tag = Leader + #
nnoremap <Leader># <C-]>

"""""""""""""""""
" V A R I O U S "
"""""""""""""""""

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

" matchit.vim
packadd! matchit

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

" tagbar-phpctags
let g:tagbar_phpctags_bin='~/bin/phpctags'

" Markdown
let g:vim_markdown_folding_disabled = 1

" Javascript
let g:javascript_plugin_jsdoc = 1

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

" Mustache / Handlebars
let g:mustache_abbreviations = 1

" Ale
" only lint when saving files
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" open error list in quickfix
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" support for airline
let g:airline#extensions#ale#enabled = 1
" always show the gutter
let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'javascript': ['jshint'],
\   'php': ['php', 'phpcs'],
\}
let g:ale_php_phpcs_standard = 'PSR2'

" Gutentags
" don't enable Gutentags by default
let g:gutentags_enabled = 0

" Dutyl (D-Support)
let g:dutyl_stdImportPaths=['/usr/include/dmd']
"call dutyl#register#tool('dcd-client','/path/to/DCD/dcd-client')
"call dutyl#register#tool('dcd-server','/path/to/DCD/dcd-server')
