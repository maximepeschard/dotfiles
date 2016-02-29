#### SETUP ####
export EDITOR="vim"
# Completion settings
autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# from :
# http://stackoverflow.com/questions/24226685/have-zsh-return-case-insensitive-auto-complete-matches-but-prefer-exact-matches

#### ALIASES ####
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias la="ls -aGp"
alias ls="ls -Gp"
alias ll="ls -lGh"
alias lla="ls -lGha"
alias mkdir="mkdir -p"
alias cdp="cd .."
alias cdpp="cd ../.."
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -v"
alias gd="git diff"
alias gst="git status"
alias glo="git log"
alias gloo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#### RUBY ####
# Rbenv for Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#### PYTHON ####
# Pyenv for Python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#### UTILITIES ####

# Create and enter a directory
function mkcd () {
    mkdir "$@" && cd "$@"
}

# Tex to pdf and remove aux files
function makepdf () {
    filename="$1"
    prefix=${filename%.tex}
    pdflatex $filename && pdflatex $filename && rm -f $prefix.aux $prefix.log $prefix.out $prefix.toc
}

# Beamer to pdf and remove aux files
function makeslides () {
    filename="$1"
    prefix=${filename%.tex}
    makepdf $filename && rm -f $prefix.nav $prefix.snm
}

