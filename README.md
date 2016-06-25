# Maxime's dotfiles

My beloved dotfiles. Feel free to fork or get inspired or hate.

![Screenshot of my custom shell prompt](http://maximepeschard.github.io/images/zshprompt.png)

## Installation

The `install.sh` script provided takes care of creating directories (like
`~/.zsh` and `~/.vim`) and symlinking all the files.

The `.zshrc` file just sources the following setup files :
* `zsh/setup.zsh`, which contains global setup, useful aliases and functions
* `zsh/local-setup.zsh` **if it exists**, which is meant to contain local
  aliases, credentials, etc
* `zsh/history.zsh`, which contains the command history configuration
* `zsh/prompt.zsh`, which defines a custom prompt


## Usage and local setup

### Local setup

To add local setup (aka stuff relevant only on a specific host), the following
files should be used :
* `zsh/local-setup.zsh` (for local aliases, ...)
* `git/gitconfig-local` (for username, ...)
* `vim/vimrc-local` (for local settings)

For example, the `$DEFAULT_USER` variable (used for the prompt) can be defined
in `local-setup.zsh`.

### Apply changes

To apply changes (after the creation or modification of a "local" file, for
example), just run `install.sh` again.


## Credits

The custom prompt is *heavily* inspired and adapted from both :
* the [*Agnoster*
  theme](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/agnoster.zsh-theme)
(and more generally [**Oh My Zsh**](https://github.com/robbyrussell/oh-my-zsh))
* [this blog post](http://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
  for the *Git* part 

The `history.zsh` configuration file is directly taken from [**Oh My
Zsh**](https://github.com/robbyrussell/oh-my-zsh).


## Directory structure

~~~
dotfiles
├── .gitignore
├── LICENSE
├── README.md
├── git
│   ├── gitconfig
│   └── gitignore-global
├── install.sh
├── vim
│   ├── Tomorrow-Night.vim
│   └── vimrc
└── zsh
    ├── history.zsh
    ├── prompt.zsh
    ├── setup.zsh
    └── zshrc
~~~

