# Some useful aliases.
alias lla="ls -lah"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ..="cd .."
alias ...="cd ../.."
alias gl="git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias tree="tree -FC"
if command -v ccat 1>/dev/null 2>&1
    alias cat="ccat"
end

# Python/Ruby tools.
if status --is-interactive
    command -v pyenv 1>/dev/null 2>&1; and pyenv init - | source
    command -v pyenv-virtualenv-init 1>/dev/null 2>&1; and pyenv virtualenv-init - | source
    command -v rbenv 1>/dev/null 2>&1; and rbenv init - | source
end

# If we have a local configuration, load it.
if test -e ~/.config/fish/local_config.fish
    source ~/.config/fish/local_config.fish
end