" vim.rc configuration for my daily usage
"
" Author: Marc Hanisch
" URL: https://github.com/dubst3pp4/dotvim

" *** BASICS *** {{{
set nocompatible
set nu
syn on
" use the old regexp engine to speed up rendering
" see https://github.com/joshukraine/dotfiles/blob/master/vim-performance.md
set re=1
filetype plugin indent on
let mapleader=","
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim_undo
" }}}

" *** VISUALS *** {{{
set t_Co=256         " 256 colors in terminal
set background=dark
" enable 24bit true color {{{
if (has("termguicolors"))
  " disabled as this causes problems in tmux and screen:
  "set termguicolors  
endif
" }}}
colorscheme night-owl
"colorscheme PaperColor
"colorscheme vim-monokai-tasty
"packadd! dracula.vim
"colorscheme dracula
set ruler            " show rows and column info
set showmode         " shows current mode
set showcmd          " shows partial commands in statusline
set ttyfast          " speedup in tty
set lazyredraw       " speedup rendering while scrolling
set laststatus=2     " always show last status
set nowrap           " don't break long lines
set listchars=trail:·,tab:▸\ ,extends:‥
" workaround for local listchars, see
" https://www.reddit.com/r/vim/comments/f37vrm/problem_with_listchars_option_in_buffers/fhh5lqy/
let g:listchars = &listchars
augroup local_listchars
    au!
    au BufEnter * let &listchars = get(b:, 'listchars', get(g:, 'listchars', ''))
augroup END
set list             " show invisible characters
set hidden           " allow switch from modified buffer to another buffer
set synmaxcol=1024   " disable systax hightlighting after column n (speeds up drawing)
set splitright       " puts new vsplit windows to the right
set splitbelow       " puts new split windows to the bottom
set cursorline
set cursorlineopt=number
" }}}

" *** INDENTING *** {{{
set autoindent
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
" }}}

" *** SEARCHING *** {{{
set showmatch
set hlsearch
set ignorecase
set smartcase
set incsearch
" Press leader + h to toggle highlighting on/off, and show current value.
nnoremap <leader>h :set hlsearch! hlsearch?<CR>

" custom highlight groups to use with :match
highlight Red ctermfg=white ctermbg=red guifg=white guibg=red
highlight Yellow ctermfg=DarkBlue ctermbg=yellow guifg=DarkBlue guibg=yellow
highlight Green ctermfg=white ctermbg=DarkGreen guifg=white guibg=DarkGreen

" Press leader + s to search and replace the word under the cursort
:nnoremap <leader>s :%s/\<<C-r><C-w>\>/
" }}}

" *** FILE BROWSING *** {{{
set path+=**
" list available items
set wildmenu
" ignore some the following directorys when using fuzzy search
set wildignore+=**/.git/**
set wildignore+=**/.npm/**
set wildignore+=**/.nuxt/**
set wildignore+=**/.venv/**
set wildignore+=**/__pycache__/**
set wildignore+=**/node_modules/**
set wildignore+=**/vendor/**
" define mappings for Explore and Rexplore
nnoremap <leader>e :Explore<CR>
nnoremap <leader>r :Rexplore<CR>
" netrw settings {{{
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_browse_split = 0
let g:netrw_altv = 1
" open preview windows vertically
let g:netrw_preview   = 1
let g:netrw_list_hide= netrw_gitignore#Hide() . ',.*\.swp$,.*\.bak$'
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
augroup jumpToLastPosition
    au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
    \ |   exe "normal! g`\""
    \ | endif
augroup END
" }}}

" Definition of tag = Leader + #
nnoremap <Leader># <C-]>

" Jumping in Diff mode
" CTRL-j - next diff
nnoremap <expr> <C-J> &diff ? ']c' : '<C-J>'
" CTRL-k - previous diff
nnoremap <expr> <C-K> &diff ? '[c' : '<C-K>'
" }}}

" *** FOLDING *** {{{
set foldcolumn=0 " show fold gutter
set foldlevelstart=99 " open with all folds opened
" }}}

" *** VARIOUS *** {{{
" Simple TODO list: {{{
" enter command Todo to list all files with TODOs or FIXMEs in quicklist
command! Todo noautocmd vimgrep /TODO\|FIXME/j % | cw
command! TodoR noautocmd vimgrep /TODO\|FIXME/j ** | cw
" }}}

" toggle Quickfix and Location list {{{
nnoremap <leader>,tq :cwindow<CR>
nnoremap <leader>,tl :lwindow<CR>
" }}}

" vim diff options {{{
" ignore whitespace in vimdiff mode {{{
if &diff
    set diffopt+=iwhite
endif
" }}}

" always use vertical splits in vimdiff mode {{{
if &diff
    set diffopt+=vertical
endif
" }}}
" }}}

" some leader mappings {{{
nnoremap <leader>,b :buffers<CR>
nnoremap <leader>,r :registers<CR>
nnoremap <leader>,j :jumps<CR>
nnoremap <leader>,m :marks<CR>
nnoremap <leader>,c q:
nnoremap <leader>,p :set invpaste<CR>
nnoremap <leader>,n :set rnu!<CR>
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
" hide preview buffers
let g:airline#extensions#tabline#exclude_preview = 1

" quickly switch to the selected airline-tab (buffer)
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
" }}}

" Ale {{{
" only lint when saving files {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" }}}
" open errors in quickfix {{{
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" }}}
" support for airline
let g:airline#extensions#ale#enabled = 1
" do not always show the gutter
let g:ale_sign_column_always = 0
" error and warnings {{{
let g:ale_sign_error = ' »'
let g:ale_sign_warning = 'ℹ'
"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
" set a custon ALE msg to prepend linter name before the error
let g:ale_echo_msg_format = '%severity% [%linter%] (%code%) - %s'
" }}}

nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>al :ALELint<CR>
nnoremap <leader>ag :ALEGoToDefinition<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" Asyncomplete + vim-lsp {{{
" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,popup,noinsert
" disable diagnosticts (Ale use used for that)
let g:lsp_diagnostics_enabled = 0
nnoremap <leader><space> :LspHover<CR>
nnoremap <leader>ld :LspPeekDefinition<CR>
nnoremap <leader>lg :LspDefinition<CR>
" }}}

" Fastfold {{{
" disable FastFold for HTML files
let g:fastfold_skip_filetypes=['html']
" }}}

" vim-which-key {{{
let g:which_key_map = {}

let g:which_key_map[' '] = 'LspHover'
let g:which_key_map['#'] = 'goto tag'
let g:which_key_map['h'] = 'toggle highlights'
let g:which_key_map['nr'] = 'edit visual selection'
let g:which_key_map['s'] = 'replace word under cursor'

" , {{{
let g:which_key_map[','] = {
    \ 'name' : '+custom' ,
    \ 'b' : ['buffers' , 'list buffers'] ,
    \ 'c' : ['commands' , 'list command history'] ,
    \ 'j' : ['jumps' , 'list jumps'] ,
    \ 'm' : ['marks' , 'list marks'] ,
    \ 'n' : [':set rnu!' , 'toggle relative numbers'] ,
    \ 'p' : [':set invpaste' , 'toggle pastemode'] ,
    \ 'r' : ['registers' , 'list registers'] ,
    \ }
" }}}

" ,t {{{
let g:which_key_map[',']['t'] = {
    \ 'name' : '+toggle windows' ,
    \ 'l' : ['lwindow' , 'toggle Location list'] ,
    \ 'q' : ['cwindow' , 'toggle Quickfix window'] ,
    \ }
" }}}

" ale {{{
let g:which_key_map['a'] = {
    \ 'name' : '+ALE' ,
    \ 'f' : ['ALEFix' , 'fix buffer'] ,
    \ 'g' : ['ALEGoToDefinition' , 'goto definition'] ,
    \ 'l' : ['ALELint' , 'lint buffer'] ,
    \ }
" }}}

" lsp {{{
let g:which_key_map['l'] = {
    \ 'name' : '+LSP' ,
    \ 'd' : ['LspPeekDefinition' , 'peek definition'] ,
    \ 'g' : ['LspDefinition' , 'goto definition'] ,
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

" Signify {{{
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = '↛'
highlight link SignifySignAdd             diffAdded
highlight link SignifySignDelete          diffRemoved
highlight SignifySignChange ctermfg=222 guifg=#ecc48d cterm=NONE gui=NONE 
highlight link SignifySignChangeDelete    SignifySignChange
highlight link SignifySignDeleteFirstLine SignifySignDelete
" }}}

" Doge {{{
let g:doge_doc_standard_python = 'numpy'
let g:doge_doc_standard_javascript = 'jsdoc'
let g:doge_doc_standard_typescript = 'jsdoc'
let g:doge_filetype_aliases = {
\  'javascript': ['typescript', 'vue']
\}
" }}}

" Rainbow Parentheses {{{
augroup enableRainbowParentheses
    autocmd FileType lisp,scheme,clojure RainbowParentheses
augroup END
"}}}

" vim-vue-plugin {{{
" enable typescript
let g:vim_vue_plugin_config = {
      \'syntax': {
          \   'template': ['html'],
          \   'script': ['javascript', 'typescript'],
          \   'style': ['css', 'scss'],
          \},
          \'full_syntax': ['html', 'css', 'scss', 'javascript', 'typescript'],
          \'attribute': 1,
          \'keyword': 1,
          \'foldexpr': 0,
          \'debug': 0,
\}
"}}}

" editorconfig {{{
" make sure editorconfig rules don't apply to fugitive buffers
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" }}}

" asciidoctor {{{
let g:asciidoctor_syntax_conceal = 1
let g:asciidoctor_fenced_languages = ['bash', 'python', 'javascript']
" }}}

" }}}

" vim:foldmethod=marker:foldlevel=0
