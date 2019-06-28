# My Vim configuration

Guide on building dotvim repository: <https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560>

## Mission

Build a configuration for daily editing of JavaScript, PHP and Python files.

At the moment the following features are provided:

- Autocompletion (YouCompleteMe)
- Syntax linting and checking (Ale)
- Code structure browsing (tagbar)
- Git support (vim-fugitive & vim-gitgutter)
- Matching of XML/HTML tags (matchit)
- Matching of Parenthesis (rainbow-parenthesis)
- Snippets (snipmate, snipmate-snippets)

## Plugins

### General plugins

- [vim-airline](https://github.com/vim-airline/vim-airline), impressive status
  line
- [Tagbar](https://github.com/majutsushi/tagbar), lists tags in its own window
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), an autocompletion
  engine
- [delimitMate](https://github.com/Raimondi/delimitMate), autoclose parens,
  braces, brackets and quotes
- [vim-signature](https://github.com/kshenoy/vim-signature), shows marks in
  gutter
- [vim-abolish](https://github.com/tpope/tpope-vim-abolish.git), better
  substitution commands
- [vim-snipmate](https://github.com/garbas/vim-snipmate), insert snippets with
  just on ekeypress (or two ;-))
- [vim-snippets](https://github.com/honza/vim-snippets), useful default snippets
  for vim-snipmate

and some more...

### Language specific

- [Ale](https://github.com/w0rp/ale), Ale - the Asynchronous Lint Engine

#### Handlebars / Mustache

- [vim-mustache-handlebars](https://github.com/mustache/vim-mustache-handlebars),
  Handlebars support

#### FreePascal

- [vim-freepascal](https://github.com/boeckmann/vim-freepascal), modern support
  for FreePascal

#### PHP

- [tagbar-phpctags.vim](https://github.com/vim-php/tagbar-phpctags.vim), better
  PHP support for tagbar

### Git specific plugins

- [vim-fugitive](https://github.com/tpope/vim-fugitive), adds shortcuts for
  adding, commiting and pushing files
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter), shows marks in the
  gutter column

## Requirements

- build-essentials, python (required by YouCompleteMe)
- jshint (required by Ale)
- Node.js and npm (jshint)
- powerline patched fonts for vim-airline (<https://github.com/powerline/fonts>)
- PHP (required by PHP_CodeSniffer, phpctags)
- PHP_CodeSniffer (phpcs, required by Ale, install latest version!)
- phpctags (required by tagbar-phpctags.vim)

## Update plugins

I've changed a little script that I found somewhere (sorry!) to update all
plugins:

    update_plugins.sh

When YouCompleteMe is updated, the binary can be compiled from within the
plugin-directory with

    ./install.py --clang-completer --ts-completer

