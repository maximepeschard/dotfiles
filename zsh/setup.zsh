#### SETUP ####
export EDITOR="vim"
# Key bindings
bindkey -e
bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey '^[[3~' delete-char
# Word deletion
autoload -U select-word-style
select-word-style bash
# Completion settings
if hash brew 2>/dev/null; then
    fpath=($HOME/.zsh/func $fpath)
fi
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
case $(uname) in
    'Linux')
        alias ls="ls --color=auto -F";;
    'Darwin')
        alias ls="ls -FG";;
    *)
        alias ls='ls -F';;
esac
alias la="ls -A"
alias ll="ls -hl"
alias lla="la -hl"
alias mkdir="mkdir -p"
alias cdp="cd .."
alias cdpp="cd ../.."
alias ..="cd .."
alias ...="cd ../.."
alias .....="cd ../../.."
alias grep="grep --color=auto"
alias tree="tree -FC"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -v"
alias gst="git status"
alias gl="git log"
alias glp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gls="glp --stat"
alias grs="git remote show"
alias gnoprompt="touch .git_no_prompt"
alias gclean="git stash -u && git stash drop" # discard all local changes on both tracked/untracked

#### RUBY ####
# Rbenv for Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#### PYTHON ####
# Pyenv for Python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# Pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

#### UTILITIES ####

# Create and enter a directory
function mkcd () {
    mkdir "$@" && cd "$@"
}

