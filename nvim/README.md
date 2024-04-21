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

I stole my base scaffolding for organization and plugins from maxh [here](https://github.com/maxh/dotfiles/tree/main/.config/nvim).

For code styling, I used catppuccin because it was popular in the community and I could [hack it](https://github.com/catppuccin/nvim/discussions/323) to change all the colors to what I wanted. This isn't for everyone, but I wanted a pastel pink theme with high contrast. More catppucin docs are [here](https://catppuccin-website.vercel.app/ports/nvim).

<img width="675" alt="Screenshot 2024-01-05 at 12 09 31 PM" src="https://github.com/evelynting610/dotfiles/assets/8283768/8b0383eb-ff6a-432b-aae4-597a194f4565">

For finding files, I am using Telescope. I'm using fzf as a picker and ripgrep as a selector. To install ripgrep, you have to `brew install ripgrep`. I looked into using `sharkdp/fd`, but ripgrep performed the same plus could grep in files. [Here](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md) are the ripgrep commands. Since my codebase is large, I have a separate function to find things in JS files vs. Python files etc. I also [turned off](https://www.reddit.com/r/neovim/comments/ltj8re/trying_out_telescopenvim/) the preview function to improve performance.

For an lsp, I am using `neovim/nvim-lspconfig`. I considered coc.nvim and ale. However, decided coq was too heavyweight and had more than what I needed. I also looked at a [poll on Reddit](https://www.reddit.com/r/neovim/comments/t1bwys/coc_lsp_or_ale_what_to_you_use_for_development/) and people overwhelming preferred "Native Lsp". What is "Native Lsp"? It's a combination of the nvim-lsp plus mason plus nvim-cmp. [This](https://levelup.gitconnected.com/configure-linting-formatting-and-autocompletion-in-neovim-a2cf15e2e04d) is the best guide I used for configuring Native Lsp. I consideres using lsp-zero instead, but wanted to have the flexibility of changing each of the parts.
The language server docs for nvim-lspconfig are [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sorbet). [Here](https://microsoft.github.io/language-server-protocol/implementors/servers/) is a mapping of languages to lsps. One cool thing is that there are even some lsps on there, such as Sorbet, that you would not expect (since Sorbet typechecks for Ruby). So look out for those too -- they're really helpful.

For linting, people recommended null-ls. However, that has since been deprecated. I followed [this reddit thread](https://www.reddit.com/r/neovim/comments/15pj1oi/using_nvimlint_as_a_nullls_alternative_for_linters/) on linters to setup mine.

## Dependencies

By default in Unix (including MacOS), neovim looks for the configuration in ~/.config/nvim. So, the nvim folder here should go in that path.

For my Telescope implementation: `brew install ripgrep`

For "Native Lsp": Install any language servers you need. I had to install the lua language server (`brew install lua-language-server`). I also installed luacheck (`brew install luacheck`). For linting, I installed a bunch through Mason (`:MasonInstall black flake8 pyright eslint_d prettier prettierd shellcheck stylua`), and also configured a `.luacheckrc` file at root to ignore globals such as vim and require.

For Neotree: Install a NerdFont. The full list is [here](https://www.nerdfonts.com/font-downloads). You can install this through brew as well
`brew tap homebrew/cask-fonts`
`brew install font-hack-nerd-font --cask`

For Python Development: Go into your virtual environment. `pip install ruff-lsp`
