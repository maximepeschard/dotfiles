# Maxime's dotfiles

My beloved dotfiles. Feel free to fork or get inspired or hate.

## Installation

An `install.sh` script is provided. It takes care of symlinking dotfiles in `~`
and the Vim theme in `~/.vim/colors`.

If *Oh-My-Zsh* is installed (*ie* `~/.oh-my-zsh` exists), some symlinks are
created in the `~/.oh-my-zsh/custom` directory and a more approriate `.zshrc` is
used.

## What's included

~~~
dotfiles
├── .gitignore
├── README.md
├── git
│   ├── .gitconfig
│   └── .gitignore_global
├── install.sh
├── vim
│   ├── .vimrc
│   └── Tomorrow-Night.vim
└── zsh
    ├── .zshrc
    ├── oh-my-zsh
    │   ├── .zshrc
    │   └── agnostermod.zsh-theme
    └── setup.zsh
~~~

