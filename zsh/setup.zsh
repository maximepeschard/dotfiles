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

#### fzf ####

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi
# fzf via local installation
if [ -e ~/.fzf ]; then
  PATH=$PATH:~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi
# fzf + ag configuration
if which fzf >/dev/null && which ag >/dev/null; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

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
alias gti="git"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -v"
alias gst="git status"
alias gl="git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
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

