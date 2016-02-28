#!/usr/bin/env bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ZSH [and OH-MY-ZSH]

export APPROPRIATE_ZSHRC
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # Oh-My-Zsh not installed
    APPROPRIATE_ZSHRC="$DOTFILES_DIR/zsh/.zshrc"
    mkdir -p "~/.zsh"
    ln -fsv "$DOTFILES_DIR/zsh/setup.zsh" "~/.zsh"
    ln -fsv "$DOTFILES_DIR/zsh/local-setup.zsh" "~/.zsh"
else
    # Oh-My-Zsh installed
    APPROPRIATE_ZSHRC="$DOTFILES_DIR/zsh/oh-my-zsh/.zshrc"
    ln -fsv "$DOTFILES_DIR/zsh/setup.zsh" "$HOME/.oh-my-zsh/custom"
    if [ -e "$DOTFILES_DIR/zsh/local-setup.zsh" ]; then
        ln -fsv "$DOTFILES_DIR/zsh/local-setup.zsh" "$HOME/.oh-my-zsh/custom"
    fi
    ln -fsv "$DOTFILES_DIR/zsh/oh-my-zsh/agnostermod.zsh-theme" "$HOME/.oh-my-zsh/custom/themes"
fi

# Link zshrc
ln -fsv "$APPROPRIATE_ZSHRC" "$HOME/.zshrc"

# VIM

# Link theme
if [ ! -d "$HOME/.vim/colors" ]; then
    # Vim directory does not exist
    mkdir -p "$HOME/.vim/colors"
fi
ln -fsv "$DOTFILES_DIR/vim/Tomorrow-Night.vim" "$HOME/.vim/colors"
# Link vimrc
ln -fsv "$DOTFILES_DIR/vim/.vimrc" ~

# GIT

# Link gitignore
ln -fsv "$DOTFILES_DIR/git/.gitignore_global" ~
# Link gitconfig
ln -fsv "$DOTFILES_DIR/git/.gitconfig" ~

