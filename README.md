# dotfiles

Some (hopefully platform-independent) dotfiles.

## Installation

Run `install.sh` to install some stuff and create symbolic links.
If everything is already installed and linked, this should have no effect.

## Post-installation

### Local configuration

Local configuration should be written into the following files :

* `fish/local_config.fish`
* `git/gitconfig-local`
* `vim/vimrc-local`

### Tmux

To install plugins with TPM, start a tmux server and hit `<Prefix>` and `<Shift-I>`.

### Terminal

To install One Dark theme, import the theme downloaded in `themes` with :
* on iTerm : `Preferences > Profiles > Default > Colors > Color Presets > Import`
* on Terminal.app : `Preferences > Profiles > Import`
* other : ¯\_(ツ)_/¯

### Font

[Iosevka](https://github.com/be5invis/Iosevka) is nice :thumbsup: 
