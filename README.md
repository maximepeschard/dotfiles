# Maxime's dotfiles

My (hopefully) platform-independent dotfiles.

![Screenshot of my terminal](http://maximepeschard.keybase.pub/static/dotfiles.png)

## Installation

The `install.sh` script provided takes care of :
* creating "dot" directories in your home (like`~/.zsh` and `~/.vim`)
* symlinking relevant files
* installing [Vundle](https://github.com/VundleVim/Vundle.vim) if isn't found
* installing [TPM](https://github.com/tmux-plugins/tpm) if it isn't found
* fetching a terminal theme

The `.zshrc` file simply sources the following setup files :
* `zsh/setup.zsh`, which contains global setup, useful aliases and functions
* `zsh/local-setup.zsh` **if it exists**, which is meant to contain local
  aliases, credentials, etc
* `zsh/history.zsh`, which contains the command history configuration
* `zsh/prompt.zsh`, which defines a custom prompt

## Post-installation

### Local files

To add local setup (aka stuff relevant only on a specific host), the following
files should be used :
* `zsh/local-setup.zsh` (for local aliases, ...)
* `git/gitconfig-local` (for username, ...)
* `vim/vimrc-local` (for local settings)

For example, the `$DEFAULT_USER` variable (used for the prompt) can be defined
in `local-setup.zsh`.

**Note that if local files are created after installation, you must run
`install.sh` again.**

### Tmux

To install plugins with TPM, start a tmux server and hit `<Prefix>` and `<Shift-I>`.

### Terminal

To install One Dark theme, import the theme downloaded in `themes` with :
* on iTerm : `Preferences > Profiles > Default > Colors > Color Presets > Import`
* on Terminal.app : `Preferences > Profiles > Import`
* other : ¯\_(ツ)_/¯

### Font

[Iosevka](https://github.com/be5invis/Iosevka) is nice :thumbsup: 

## Credits

* the [*Agnoster*
  theme](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/agnoster.zsh-theme)
(and more generally [**Oh My Zsh**](https://github.com/robbyrussell/oh-my-zsh))
* [this blog post](http://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
  for the *Git* prompt 
* [this blog post](https://statico.github.io/vim3.html) for an updated *Vim*
  configuration
* many forgotten but really helpful answers on *Stack Overflow*...

*NB* : The `history.zsh` configuration file is directly taken from [**Oh My
Zsh**](https://github.com/robbyrussell/oh-my-zsh).


## Directory structure

```
dotfiles
├── LICENSE
├── README.md
├── git/
│   ├── gitconfig
│   └── gitignore-global
├── install.sh*
├── tmux/
│   ├── project-session
│   └── tmux.conf
├── vim/
│   └── vimrc
└── zsh/
    ├── history.zsh
    ├── prompt.zsh
    ├── setup.zsh
    └── zshrc
```
