# Source global and local setup
[ -e "$HOME/.zsh/setup.zsh" ]; && source "$HOME/.zsh/setup.zsh"
[ -e "$HOME/.zsh/local-setup.zsh" ]; && source "$HOME/.zsh/local-setup.zsh"

# Short prompt
PROMPT='[%{$fg[green]%}%~%{$reset_color%}]%# '

