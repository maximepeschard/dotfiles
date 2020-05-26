#!/usr/bin/env bash

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##############
# Fish setup #
##############
fish_dir="$HOME/.config/fish"
mkdir -p "$fish_dir/functions"
ln -fsv "$dotfiles_dir/fish/config.fish" $fish_dir
if [ ! -e "$dotfiles_dir/fish/local_config.fish" ]; then
    echo "# Put local Fish config here." > "$dotfiles_dir/fish/local_config.fish"
fi
ln -fsv "$dotfiles_dir/fish/local_config.fish" $fish_dir
for func in $(ls $dotfiles_dir/fish/functions/*.fish)
do
    ln -fsv $func "$fish_dir/functions/$(basename $func)"
done

#############
# Vim setup #
#############
ln -fsv "$dotfiles_dir/vim/vimrc" "$HOME/.vimrc"
if [ ! -e "$dotfiles_dir/vim/vimrc-local" ]; then
    echo "\" Put local Vim config here." > "$dotfiles_dir/vim/vimrc-local"
fi
ln -fsv "$dotfiles_dir/vim/vimrc-local" "$HOME/.vimrc-local"
# Install Vundle
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    # Vundle directory does not exist
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

#############
# Git setup #
#############
ln -fsv "$dotfiles_dir/git/gitignore-global" "$HOME/.gitignore-global"
ln -fsv "$dotfiles_dir/git/gitconfig" "$HOME/.gitconfig"
if [ ! -e "$dotfiles_dir/git/gitconfig-local" ]; then
    echo "# Put local Git config here." > "$dotfiles_dir/git/gitconfig-local"
fi
ln -fsv "$dotfiles_dir/git/gitconfig-local" "$HOME/.gitconfig-local"

##############
# Tmux setup #
##############
ln -fsv "$dotfiles_dir/tmux/tmux.conf" "$HOME/.tmux.conf"
# Install TPM if needed ("Prefix + I" needed after in tmux to install plugins)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
mkdir -p "$HOME/.tmux/sessions-templates"
ln -fsv "$dotfiles_dir/tmux/project-session" "$HOME/.tmux/sessions-templates/project-session"

##################
# Terminal setup #
##################
# Get One Dark theme
if [ ! -d "$dotfiles_dir/themes" ]; then
    mkdir -p "$dotfiles_dir/themes"
fi
if [ ! -d "$dotfiles_dir/themes/atom-one-dark-terminal" ]; then
    git clone https://github.com/nathanbuchar/atom-one-dark-terminal.git "$dotfiles_dir/themes/atom-one-dark-terminal"
fi
