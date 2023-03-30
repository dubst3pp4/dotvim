# My Vim configuration

Guide on building dotvim repository: <https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560>

## Mission

Build a configuration for daily editing of TypeScript, JavaScript, Vue, HTML,
CSS/SASS, Python and Markdown files.

At the moment the following features are provided:

- Autocompletion (Ale)
- Syntax linting and checking (Ale)
- Git support (vim-fugitive & vim-signify)
- Matching of XML/HTML tags (matchit)
- Matching of Parenthesis (rainbow-parenthesis)
- Display keybindings (vim-which-key)

## Update plugins

I've changed a little script that I found somewhere (sorry!) to update all
plugins:

```
update_plugins.sh
```

When vim-doge is updated, the plugin must be initialized by executing

```
:call doge#install()
```

from within Vim.

