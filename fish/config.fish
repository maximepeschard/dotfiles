# Some useful aliases.
alias lla="ls -lah"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ..="cd .."
alias ...="cd ../.."
alias gl="git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias tree="tree -FC"
alias pipreset="pip freeze | xargs pip uninstall -y"

# Some useful environment variables
set -x EDITOR vim
set -x PAGER less

# Python
status is-login; and pyenv init --path | source
pyenv init - | source
if status --is-interactive
#    command -v pyenv 1>/dev/null 2>&1; and pyenv init - | source
    command -v pyenv-virtualenv-init 1>/dev/null 2>&1; and pyenv virtualenv-init - | source
end

# If we have a local configuration, load it.
if test -e ~/.config/fish/local_config.fish
    source ~/.config/fish/local_config.fish
end
