# Maxime's dotfiles

My beloved dotfiles. Feel free to fork or get inspired or hate.

![Screenshot of my custom shell prompt](http://maximepeschard.github.io/images/zshprompt.png)

## Installation

An `install.sh` script is provided. It takes care of symlinking dotfiles in `~`
and the Vim theme in `~/.vim/colors`.

The script also creates a `~/.zsh` directory if it does not exist yet and
symlinks there the following setup files :
* `zsh/setup.zsh`, which contains global setup, useful aliases and functions
* `zsh/local-setup.zsh` **if it exists**, which is meant to contain local
  aliases, credentials, etc
* `zsh/history.zsh`, which contains the command history configuration
* `zsh/prompt.zsh`, which defines a custom prompt

The custom prompt is *heavily* inspired and adapted from both :
* the [*Agnoster*
  theme](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/agnoster.zsh-theme)
(and more generally [**Oh My Zsh**](https://github.com/robbyrussell/oh-my-zsh))
* [this blog post](http://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
  for the *Git* part 

The `history.zsh` configuration file is directly taken from [**Oh My
Zsh**](https://github.com/robbyrussell/oh-my-zsh).


## Usage and local setup

All the stuff that is relevant only on a specific host should go into a
`zsh/local-setup.zsh` file. Specifically, the `$DEFAULT_USER` variable should be
defined there.

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
    ├── history.zsh
    ├── prompt.zsh
    └── setup.zsh
~~~

