# My Vim configuration

Guide on building dotvim repository: https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560

## Plugins
### General plugins
- Airline, impressive status line
- CTRLP, a fuzzy file and buffer finder
- DelimitMate, autoclose braces, brackets and quotes
- Gutentags, creates tagfiles on-the-fly
- NERDTree, a file drawer
- Tagbar, lists ctags in its own window
- YouCompleteMe, an autocompletion engine
- vim-signature, shows marks in gutter

### Language specific
- Syntastic, a universal syntax checker
#### JavaScript
- tagbar-javascript.vim, JavaScript support for Tagbar
- tern_for_vim, used by YouCompleteMe to support JavaScript
#### PHP
- vim-phpfmt, formats PHP files with the help of phpcbf
#### FreePascal
- vim-freepascal, modern support for FreePascal
- syntastic-freepascal-checker, my own Syntastic FreePascal checker

### Git specific plugins
- NERDTree-git-plugin, shows git status next to the filenames
- vim-fugitive, adds shortcuts for adding, commiting and pushing files
- vim-gitgutter, shows marks in the gutter column

## Requirements
- jshint (required by Syntastic)
- esctags (required by tagbar-javascript.vim)
- build-essentials, python (required by YouCompleteMe)
- PHP_CodeSniffer (phpcs & phpbcf, required by vim-phpfmt and Syntastic)
- fpc (required by syntastic-freepascal-checker)

## Update plugins
I've changed a little script that I found somewhere (sorry!) to update all plugins:
    
    update_plugins.sh

When YouCompleteMe is updated, the binary can be compiled from within the plugin-directory with

    ./install.py --clang-completer --tern-completer

