" vim.rc configuration for my daily usage
"
" Author: Marc Hanisch
" URL: https://github.com/dubst3pp4/dotvim

" *** BASICS *** {{{
set nocompatible
set nu
syn on
filetype plugin indent on
let mapleader=","
" }}}

" *** VISUALS *** {{{
set t_Co=256         " 256 colors in terminal
set background=dark
" enable 24bit true color {{{
if (has("termguicolors"))
  set termguicolors
endif
" }}}
colorscheme night-owl
set ruler            " show rows and column info
set showmode         " shows current mode
set ttyfast          " speedup in tty
set lazyredraw       " speedup rendering while scrolling
set laststatus=2     " always show last status
set nowrap           " don't break long lines
set listchars=tab:▸\ 
set list
set hidden           " allow switch from modified buffer to another buffer
set synmaxcol=1000 " disable systax hightlighting after column n (speeds up drawing)
" }}}

" *** INDENTING *** {{{
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
" }}}

" *** SEARCHING *** {{{
set showmatch
set hlsearch
set ignorecase
set smartcase
set incsearch
" Press leader + SPACE to toggle highlighting on/off, and show current value.
nnoremap <leader><space> :set hlsearch! hlsearch?<CR>
" }}}

" *** FILE BROWSING *** {{{
set path+=**
" list available items
set wildmenu
" ignore some the following directorys when using fuzzy search
set wildignore+=**/node_modules/**
set wildignore+=**/vendor/**
set wildignore+=**/__pycache__/**
" netrw settings {{{
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_list_hide= netrw_gitignore#Hide() . '.*\.swp$,.*\.bak$'
" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
augroup netrwCloseBuffer
    autocmd FileType netrw setl bufhidden=delete
augroup END
" }}}
" }}}

" *** NAVIGATION *** {{{
nnoremap j gj
nnoremap k gk

" when opening a file, jump to last position ('.) {{{
au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
   \ |   exe "normal! g`\""
   \ | endif
" }}}

" Definition of tag = Leader + #
nnoremap <Leader># <C-]>

" Jumping in Diff mode
" CTRL-j - next diff
nnoremap <expr> <C-J> &diff ? ']c' : '<C-J>'
" CTRL-h - previous diff
nnoremap <expr> <C-H> &diff ? '[c' : '<C-H>'
" }}}

" *** FOLDING *** {{{
set foldcolumn=1 " show fold gutter
set foldlevelstart=99 " open with all folds opened
" }}}

" *** VARIOUS *** {{{
" Simple TODO list: {{{
" enter command Todo to list all files with TODOs or FIXMEs in quicklist
command! Todo noautocmd vimgrep /TODO\|FIXME/j % | cw
command! TodoR noautocmd vimgrep /TODO\|FIXME/j ** | cw
" }}}

" when Quickfix or Locationlist is populated, open it {{{
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END
" }}}
" toggle Quickfix and Location list
nnoremap <leader>,tq :cwindow<CR>
nnoremap <leader>,tl :lwindow<CR>

" ignore whitespace in vimdiff mode {{{
if &diff
    set diffopt+=iwhite
endif
" }}}

" some leader mappings {{{
nnoremap <leader>,b :buffers<CR>
nnoremap <leader>,r :registers<CR>
nnoremap <leader>,c q:
nnoremap <leader>w <C-w>
nnoremap <leader>p :set invpaste<CR>
" }}}
" }}}

" *** PLUGINS *** {{{

" matchit.vim {{{
packadd! matchit
" }}}

" Airline {{{
let g:airline_powerline_fonts=1
" don't show whitespace info
let g:airline#extensions#whitespace#enabled = 0
" show a tabline with buffer numbers and filenames
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" quickly switch to the selected airline-tab (buffer)
let g:airline#extensions#tabline#buffer_idx_mode = 1
" }}}

" Tagbar {{{
nnoremap <Leader>t :TagbarToggle<CR>
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
let g:tagbar_phpctags_bin='/home/marc/bin/phpctags'

" tagbar-asciidoc
let g:tagbar_type_asciidoc = {
    \ 'ctagstype' : 'asciidoc',
    \ 'kinds' : [
        \ 'h:table of contents',
        \ 'a:anchors:1',
        \ 't:titles:1',
        \ 'n:includes:1',
        \ 'i:images:1',
        \ 'I:inline images:1'
    \ ],
    \ 'sort' : 0
\ }
" }}}

" SnipMate {{{
" to prevent clash with youcompleteme, change snippet trigger to CTRL-SPACE
imap <C-SPACE> <esc>a<Plug>snipMateNextOrTrigger
smap <C-SPACE> <Plug>snipMateNextOrTrigger
" }}}

" Mustache / Handlebars {{{
let g:mustache_abbreviations = 1
" }}}

" YouCompleteMe {{{
" disable diagnostics
let g:ycm_show_diagnostics_ui = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" }}}

" Ale {{{
" only lint when saving files {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
" }}}
" open error list in locationlist {{{
let g:ale_open_list = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
" }}}
" support for airline
let g:airline#extensions#ale#enabled = 1
" do not always show the gutter
let g:ale_sign_column_always = 0
" do not highlight errors
let g:ale_set_highlights = 0
" error and warning signs {{{
let g:ale_sign_error = '💥'
let g:ale_sign_warning = '😳'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" }}}

let g:ale_linters = {
\   'javascript': ['jshint'],
\   'php': ['php', 'phpcs'],
\   'ruby': ['rubocop', 'ruby'],
\   'python': ['pylint']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'php': ['phpcbf'],
\   'ruby': ['rubocop'],
\   'python': ['autopep8']
\}
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_php_phpcbf_standard = 'PSR2'
let g:ale_python_pylint_executable = 'pylint3'
let g:ale_python_autopep8_executable = 'autopep8'
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>al :ALELint<CR>
" }}}

" Nerdtree {{{
map <Leader>n :NERDTreeToggle<CR>
" }}}

" Colorizer {{{
" enable Colorizer for HTMl, CSS, Less and SASS
let g:colorizer_auto_filetype='css,html,less,scss,vim' 
" }}}

" PHP.vim {{{
" enable highlighting of PHPDoc blocks
function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
" }}}

" Fastfold {{{
" disable FastFold for HTML files
let g:fastfold_skip_filetypes=['html']
" }}}

" vim-which-key {{{
let g:which_key_map = {}

let g:which_key_map[' '] = 'toggle highlight'
let g:which_key_map['#'] = 'goto tag'
let g:which_key_map['nr'] = 'edit visual selection'

" , {{{
let g:which_key_map[','] = {
    \ 'name' : '+custom' ,
    \ 'b' : ['buffers' , 'list buffers'] ,
    \ 'c' : ['commands' , 'list command history'] ,
    \ 'r' : ['registers' , 'list registers'] ,
    \ }
" }}}

" ,t {{{
let g:which_key_map[',']['t'] = {
    \ 'name' : '+toggle windows' ,
    \ 'q' : ['cwindow' , 'toggle Quickfix window'] ,
    \ 'l' : ['lwindow' , 'toggle Location list'] ,
    \ }
" }}}

" a {{{
let g:which_key_map['a'] = {
    \ 'name' : '+ALE' ,
    \ 'l' : ['ALELint' , 'lint buffer'] ,
    \ 'f' : ['ALEFix' , 'fix buffer'] ,
    \ }
" }}}

" w (not working) {{{
let g:which_key_map['w'] = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , 'other-window']          ,
    \ 'd' : ['<C-W>c'     , 'delete-window']         ,
    \ '-' : ['<C-W>s'     , 'split-window-below']    ,
    \ '|' : ['<C-W>v'     , 'split-window-right']    ,
    \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
    \ 'h' : ['<C-W>h'     , 'window-left']           ,
    \ 'j' : ['<C-W>j'     , 'window-below']          ,
    \ 'l' : ['<C-W>l'     , 'window-right']          ,
    \ 'k' : ['<C-W>k'     , 'window-up']             ,
    \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
    \ 'J' : ['resize +5'  , 'expand-window-below']   ,
    \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
    \ 'K' : ['resize -5'  , 'expand-window-up']      ,
    \ '=' : ['<C-W>='     , 'balance-window']        ,
    \ 's' : ['<C-W>s'     , 'split-window-below']    ,
    \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
    \ }
" }}}
 
" register the maps {{{
augroup whichKeySettings
    autocmd!
    autocmd VimEnter * call which_key#register(',', "g:which_key_map")
augroup END
" }}}

nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
set timeoutlen=500
" }}}
" }}}

" vim:foldmethod=marker:foldlevel=0
