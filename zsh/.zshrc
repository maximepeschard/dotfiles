# Global zshrc

# Source global setup : useful aliases and functions
[ -e "$HOME/.zsh/setup.zsh" ] && source "$HOME/.zsh/setup.zsh"

# Source local setup
[ -e "$HOME/.zsh/local-setup.zsh" ] && source "$HOME/.zsh/local-setup.zsh"

# Source command history configuration
[ -e "$HOME/.zsh/history.zsh" ] && source "$HOME/.zsh/history.zsh"

# Source custom prompt setup
[ -e "$HOME/.zsh/prompt.zsh" ] && source "$HOME/.zsh/prompt.zsh"

