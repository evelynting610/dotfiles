# README

My Neovim configuration is still a work in progress. However, I wanted to jot down my thoughts so it will be helpful for future me and others.

## Principles

Vim is designed for customizability. There are infinite ways to configure it, so I set a few principles that enabled me to make decisions.

**1. Keep it Lightweight**

One of the reasons I wanted to try Vim was that it allowed me to go super lightweight. I didn't want a bunch of magic happening under the hood. I wanted to understand better where each piece of magic came from, at a lower level of abstraction.

Therefore, I wanted to install as few plugins as possible and as lightweight plugins as possible. If I could take out features that I didn't absolute need, I also did that. The other perk of going lightweight is that it makes working in a super large codebase faster. I don't have to wait for an advanced LSP to index files. I can configure which files to index, or just forego everything and grep around.

**2. Go Piece By Piece**

I had no background in Vim, and decided the best way to learn was to fully understand one piece before adding another piece. I started by learning the base vim key commands - how to save files, how to jump around, how to add and delete, how to copy and paste, how to handle buffers. I found the tutor program in neovim helpful for this `:Tutor`.

Then I installed one plugin, and fully learned that plugin. Then I installed another, etc. I started coding in neovim for work when I had the bare minimum installed to complete PRs - before I had linting on save or Sorbet autocompletion or many of the features I was used to on my regular code editor. I just had to start using it to learn it.

**3. Choose for Neovim and Community Support**

When there were several options for doing something I wanted, I also chose for community support. Two reasone (1) I want to install something that will be maintained against other dependency updates (2) I wanted quality and quick answers if I ran into problems. If Neovim itself maintained a plugin version, I chose that because it was the option closest to Neovim updates. I followed polls on Reddit for what people were using and what they were discussing.

## Process

I stole my base scaffolding for organization and plugins from maxh [here](https://github.com/maxh/dotfiles/tree/main/.config/nvim)

For code styling, I used catppuccin because it was popular in the community and I could hack it to change all the colors to what I wanted. This isn't for everyone, but I wanted a pastel pink theme

## Dependencies

For my Telescope implementation: `brew install ripgrep`

For "Native Lsp": Install any language servers you need. I had to install the lua language server (`brew install lua-language-server`). For linting, I installed a bunch through Mason, and also configured a `.luacheckrc` file at root to ignore globals such as vim and require.

For Neotree: Install a NerdFont. The full list is [here](https://www.nerdfonts.com/font-downloads)
