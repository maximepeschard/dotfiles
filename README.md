# Maxime's dotfiles

My beloved dotfiles. Feel free to fork or get inspired or hate.

## Installation

An `install.sh` script is provided. It takes care of symlinking dotfiles in `~`
and the Vim theme in `~/.vim/colors`.

If *Oh-My-Zsh* is installed (*ie* `~/.oh-my-zsh` exists, which is currently my
case), some symlinks are created in the `~/.oh-my-zsh/custom` directory and a
more approriate `.zshrc` is used.
Else, a basic `.zshrc` is used and useful scripts are symlinked inside a
`~/.zsh` directory.

Local stuff (such as aliases meaningful only on a specific host, credentials,
etc...) can be defined in the `zsh/local-setup.zsh` file, which is ignored by
Git.

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

