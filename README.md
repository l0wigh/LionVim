[[https://github.com/L0Wigh/lionvim/blob/lionvim.png|alt=lionvim logo]]

# LionVim 0.1.0

After using [LunarVim](https://lunarvim.org) as a base for my SolarVim config.

I wanted to make my own from 0 (another one yeah).

Since I loved LunarVim setup, many of the plugins and keybinds used in LionVim are in LunarVim. I just made my own sauce.

# Essential Informations

This is a very customized Nvim configuration. It will probably not be nice for most of the people.

This repo is mainly here for me, and to help people to see how to configure nvim with modern plugins and lua files.

The installer is (for now) really simple and might be not working properly.

Requirements :

* Nvim 0.8.0 or higher
* yarn / npm
* ripgrep

# What's inside the configuration ?

LSP support with :

- lspconfig
- lsp-installer
- nvim-cmp
- treesitter
- lsp-colors
- lspsaga
- lspkind

UI with :

- Vanessa coloscheme (made by me)
- Lualine
- Barbar
- Dashboard
- nui

Workflow tools :

- Telescope
- Undotree
- Nvimtree
- Which-key
- Hop.nvim

and probably some (many) other plugins

Vim configuration :

- numbers + relative numbers
- true colors
- 4 chars long hard tabs
- no swap files
- undo folder (~/.config/lionvim/undodir)
- no wrap
- the most important setup : jklm instead of hjkl (because french keyboard) 
- and other stuff...

# Will it broke my nvim install ?

It should not broke your nvim installation but be carefull, some plugins might be installed outside my config folder like dashboard.

Never try this config without backing up your previous nvim config.
