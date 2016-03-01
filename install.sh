#!/usr/bin/env bash

# Get the storage directory for the dotfiles
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ZSH
export ZSHRC_PATH="$DOTFILES_DIR/zsh/.zshrc"
# Store setup files in ~/.zsh directory
if [ ! -d "$HOME/.zsh" ]; then
    mkdir -p "$HOME/.zsh"
fi
ln -fsv "$DOTFILES_DIR/zsh/setup.zsh" "$HOME/.zsh"
[ -e "$DOTFILES_DIR/zsh/local-setup.zsh" ] && ln -fsv "$DOTFILES_DIR/zsh/local-setup.zsh" "$HOME/.zsh"
ln -fsv "$DOTFILES_DIR/zsh/history.zsh" "$HOME/.zsh"
ln -fsv "$DOTFILES_DIR/zsh/prompt.zsh" "$HOME/.zsh"
# Link .zshrc
ln -fsv "$ZSHRC_PATH" "$HOME/.zshrc"

# VIM
# Link theme
if [ ! -d "$HOME/.vim/colors" ]; then
    # Vim directory does not exist
    mkdir -p "$HOME/.vim/colors"
fi
ln -fsv "$DOTFILES_DIR/vim/Tomorrow-Night.vim" "$HOME/.vim/colors"
# Link vimrc
ln -fsv "$DOTFILES_DIR/vim/.vimrc" "$HOME"

# GIT
# Link global .gitignore
ln -fsv "$DOTFILES_DIR/git/.gitignore_global" "$HOME"
# Link global .gitconfig
ln -fsv "$DOTFILES_DIR/git/.gitconfig" "$HOME"
# Link .gitconfig_local if it exists
[ -e "$DOTFILES_DIR/git/.gitconfig_local" ] && ln -fsv "$DOTFILES_DIR/git/.gitconfig_local" "$HOME" 

