setlocal conceallevel=0

" workaround for local listchars, see
" https://www.reddit.com/r/vim/comments/f37vrm/problem_with_listchars_option_in_buffers/fhh5lqy/
let b:listchars = get(g:, 'listchars', '')..',space:·'
let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'exe')..'|unlet! b:listchars|let &listchars = get(g:, "listchars", "")'
