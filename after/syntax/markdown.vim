if &filetype !=# 'markdown'
  finish
endif

if &filetype !=# 'markdown'
  finish
endif

" --- Konfiguration: Spezial-Tags -> Icon ---
let s:tag_icons = {
      \ 'bookmark':  '🔖',
      \ 'important': '❗',
      \ 'idea':      '💡',
      \ 'A':         '🟥',
      \ 'B':         '🟧',
      \ 'C':         '🟨',
      \ }

" ------------------------------------------------------------
" 1) Generisch: #foo -> 🏷foo, aber NICHT für Spezial-Tags
" ------------------------------------------------------------
silent! syntax clear MdTagHash

" Baue ein Alternation-Pattern: \(bookmark\|important\|idea\)
let s:special_alt = '\%(' . join(keys(s:tag_icons), '\|') . '\)\>'

" Negativ-Lookahead auf den Spezial-Alternation-Block
execute 'syntax match MdTagHash /#\ze\%(' . s:special_alt . '\)\@![0-9A-Za-z_-]\+\>/'
      \ . ' contained containedin=ALL conceal cchar=🏷'

highlight default link MdTagHash Identifier


" ------------------------------------------------------------
" 2) Spezifisch: ganzer Tag -> eigenes Icon
" ------------------------------------------------------------
for [s:tag, s:icon] in items(s:tag_icons)
  execute 'silent! syntax clear MdTag_' . s:tag
  execute 'syntax match MdTag_' . s:tag . ' /#' . escape(s:tag, '/\') . '\>/'
        \ . ' contained containedin=ALL conceal cchar=' . s:icon
  execute 'highlight default link MdTag_' . s:tag . ' Special'
endfor

