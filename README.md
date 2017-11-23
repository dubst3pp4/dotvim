# My Vim configuration

Guide on building dotvim repository: https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560

## Mission
Build a configuration for daily editing of JavaScript and PHP files. Experimental support for FreePascal and Rust, too.

At the moment the following features are provided:

- Autocompletion (YouCompleteMe)
- Syntax checkers (syntastic)
- Code structure browsing (tagbar)
- Git support (vim-fugitive & vim-gitgutter)
- Fuzzy file search and overview of buffers (ctrlp)
- Matching of XML/HTML tags (matchit)

## Plugins
### General plugins
- [vim-airline](https://github.com/vim-airline/vim-airline), impressive status line
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim), a fuzzy file and buffer finder
- [delimitMate](https://github.com/Raimondi/delimitMate), autoclose parens, braces, brackets and quotes
- [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags), creates tagfiles on-the-fly
- [NERDTree](https://github.com/scrooloose/nerdtree), a file drawer
- [Tagbar](https://github.com/majutsushi/tagbar), lists tags in its own window
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), an autocompletion engine
- [vim-signature](https://github.com/kshenoy/vim-signature), shows marks in gutter
- [vim-abolish](https://github.com/tpope/tpope-vim-abolish.git), better substitution commands
- [vim-snipmate](https://github.com/garbas/vim-snipmate), insert snippets with just on ekeypress (or two ;-))
- [vim-snippets](https://github.com/honza/vim-snippets), useful default snippets for vim-snipmate

### Language specific
- [syntastic](https://github.com/vim-syntastic/syntastic), a universal syntax checker

#### JavaScript
- [tern_for_vim](https://github.com/ternjs/tern_for_vim), used by YouCompleteMe and Tagbar to support JavaScript

#### Handlebars / Mustache
- [vim-mustache-handlebars](https://github.com/mustache/vim-mustache-handlebars), Handlebars support

#### FreePascal
- [vim-freepascal](https://github.com/boeckmann/vim-freepascal), modern support for FreePascal
- [syntastic-freepascal-checker](https://github.com/dubst3pp4/syntastic-freepascal-checker), my own syntastic FreePascal checker

#### PHP
- [tagbar-phpctags.vim](https://github.com/vim-php/tagbar-phpctags.vim), better PHP support for tagbar

#### Rust
- [rust.vim](https://github.com/rust-lang/rust.vim), Support for the Rust language

### Git specific plugins
- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin), shows git status next to the filenames
- [vim-fugitive](https://github.com/tpope/vim-fugitive), adds shortcuts for adding, commiting and pushing files
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter), shows marks in the gutter column

## Requirements
- build-essentials, python (required by YouCompleteMe)
- PHP_CodeSniffer (phpcs, required by syntastic)
- jsctags (required by tern_for_vim and tagbar)
- jshint (required by Syntastic)
- fpc (required by syntastic-freepascal-checker)
- powerline patched fonts for vim-airline (https://github.com/powerline/fonts)
- phpctags (required by tagbar-phpctags.vim)
- rustc (required by rust syntastic checker)

## Update plugins
I've changed a little script that I found somewhere (sorry!) to update all plugins:
    
    update_plugins.sh

When YouCompleteMe is updated, the binary can be compiled from within the plugin-directory with

    ./install.py --clang-completer --tern-completer

When tern_for_vim is installed, you have to cd into the plugin directory and install tern requirements with

    npm install

