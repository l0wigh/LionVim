# LionVim

After using [https://lunarvim.org](https://lunarvim.org "LunarVim") as a base for my SolarVim config.

I wanted to make my own from 0 (another one yeah).

Since I loved LunarVim setup, many of the plugins used in LionVim are in LunarVim. I just made my own sauce.

# Essential Informations

This is a very customized Nvim configuration. It will probably not be nice for most of the peoples.

I don't think I'll take any PR, issues, or enhancement stuff.

This repo is mainly here for me, and to help peoples to see how to configure nvim with modern plugins and lua files.

The installer is (for now) really simple and can't be used for a full install.

Requirements :

* Nvim 0.5.0 or higher
* yarn / npm
* ripgrep
* python3-venv

# What's inside the configuration ?

LSP support with :

- lspconfig
- lsp-installer
- coq.nvim (yeah, not nvim-cmp)
- treesitter
- lsp-colors

UI with :

- Custom NeoSolarized colorscheme
- Feline
- Barbar
- Dashboard

Workflow tools :

- Telescope
- Undotree
- Nvimtree
- Which-key

and probably some other plugins

Vim configuration :

- numbers + relative numbers
- true colors
- 4 chars long hard tabs
- no swap files, undo folder (~/.config/lionvim/undodir)
- no wrap
- transparent background
- the most important setup : jklm instead of hjkl (because french keyboard) 
- and other stuff...

# Will it broke my nvim install ?

It should not broke your nvim installation but be carefull, some plugins might be installed outside my config folder like dashboard.

Never try this config with backing up your pervious nvim stuff.
