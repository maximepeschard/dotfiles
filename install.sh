#!/usr/bin/env bash

# Get the storage directory for the dotfiles
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ZSH
# Store setup files in ~/.zsh directory
if [ ! -d "$HOME/.zsh" ]; then
    mkdir -p "$HOME/.zsh"
fi
ln -fsv "$DOTFILES_DIR/zsh/setup.zsh" "$HOME/.zsh"
[ -e "$DOTFILES_DIR/zsh/local-setup.zsh" ] && ln -fsv "$DOTFILES_DIR/zsh/local-setup.zsh" "$HOME/.zsh"
ln -fsv "$DOTFILES_DIR/zsh/history.zsh" "$HOME/.zsh"
ln -fsv "$DOTFILES_DIR/zsh/prompt.zsh" "$HOME/.zsh"
# Link Homebrew completion file if installed
if hash brew 2>/dev/null; then
    mkdir -p "$HOME/.zsh/func"
    ln -fsv "$(brew --prefix)/share/zsh/site-functions/_brew" "$HOME/.zsh/func/_brew"
fi
# Link .zshrc
ln -fsv "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"

# VIM
# Link theme
if [ ! -d "$HOME/.vim/colors" ]; then
    # Vim directory does not exist
    mkdir -p "$HOME/.vim/colors"
fi
ln -fsv "$DOTFILES_DIR/vim/Tomorrow-Night.vim" "$HOME/.vim/colors"
# Link vimrc
ln -fsv "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
# Optionnally link local setup 
[ -e "$DOTFILES_DIR/vim/vimrc-local" ] && ln -fsv "$DOTFILES_DIR/vim/vimrc-local" "$HOME/.vimrc-local"
# Install Vundle
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    # Vundle directory does not exist
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

# GIT
# Link global .gitignore
ln -fsv "$DOTFILES_DIR/git/gitignore-global" "$HOME/.gitignore-global"
# Link global .gitconfig
ln -fsv "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
# Link .gitconfig_local if it exists
[ -e "$DOTFILES_DIR/git/gitconfig-local" ] && ln -fsv "$DOTFILES_DIR/git/gitconfig-local" "$HOME/.gitconfig-local" 

# TMUX
# Link tmux.conf
ln -fsv "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
# Install TPM if needed (Prefix + I needed after in tmux)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
mkdir -p "$HOME/.tmux/sessions-templates"
ln -fsv "$DOTFILES_DIR/tmux/project-session" "$HOME/.tmux/sessions-templates/project-session"
