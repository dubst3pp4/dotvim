" disabled font specific settings as the new default font of GNOME 48 already
" looks very good and provides the Nerd Font symbols
"set guifont=BlexMono\ Nerd\ Font\ 12
set linespace=3
set background=dark
colorscheme nord
if &background =~# 'dark'
  set guioptions+=d "enable dark theme
endif
set guioptions-=T "remove toolbar
set guioptions-=m "remove menu bar
set guioptions-=L "disable scrollbars left
set guioptions-=l "disable scrollbars left
set guioptions-=R "disable scrollbars right
set guioptions-=r "disable scrollbars right

" shows a contextmenu when right-clicking
set mousemodel=popup
