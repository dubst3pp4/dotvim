# My Vim configuration

Guide on building dotvim repository: <https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560>

## Mission

Build a configuration for daily editing of JavaScript, Python, PHP, AsciiDoc,
Markdown files and daily notes.

At the moment the following features are provided:

- Autocompletion (YouCompleteMe)
- Syntax linting and checking (Ale)
- Code structure browsing (tagbar)
- Git support (vim-fugitive & vim-signify)
- Matching of XML/HTML tags (matchit)
- Matching of Parenthesis (rainbow-parenthesis)
- Snippets (snipmate, snipmate-snippets)
- Display keybindings (vim-which-key)

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
- [vim-which-key](https://github.com/liuchengxu/vim-which-key), display
  keybindings

and some more...

### Language specific

- [Ale](https://github.com/w0rp/ale), Ale - the Asynchronous Lint Engine

#### Handlebars / Mustache

- [vim-mustache-handlebars](https://github.com/mustache/vim-mustache-handlebars),
  Handlebars support

#### Python

- [python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent),
  PEP8-style indentation of Python files
- [coiled-snake-plugin](https://github.com/kalekundert/vim-coiled-snake), Python
  folding for Vim

#### PHP

- [tagbar-phpctags.vim](https://github.com/vim-php/tagbar-phpctags.vim), better
  PHP support for tagbar

#### FreePascal

- [vim-freepascal](https://github.com/boeckmann/vim-freepascal), modern support
  for FreePascal

### Git specific plugins

- [vim-fugitive](https://github.com/tpope/vim-fugitive), adds shortcuts for
  adding, commiting and pushing files
- [vim-signify](https://github.com/mhinz/vim-signify), shows marks in the
  gutter column

## Requirements

- build-essentials, python (required by YouCompleteMe)
- jshint (required by Ale)
- Node.js and npm (YouCompleteMe, jshint)
- Python3 (required by Ale, YouCompleteMe)
- flake8, autopep8, pyls (required by Ale)
- PHP (required by PHP_CodeSniffer, phpctags)
- PHP_CodeSniffer (phpcs, required by Ale, install latest version!)
- phpctags (required by tagbar-phpctags.vim)
- powerline patched fonts for vim-airline (<https://github.com/powerline/fonts>)

## Update plugins

I've changed a little script that I found somewhere (sorry!) to update all
plugins:

```
update_plugins.sh
```

When YouCompleteMe is updated, the binary can be compiled from within the
plugin-directory with

```
python3 install.py --clang-completer --ts-completer
```

