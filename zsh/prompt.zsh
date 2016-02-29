# Colored prompt displaying information about :
# - status (error, root, background jobs)
# - working directory
# - Git
#
# Status part freely adapted from Agnoster theme for Oh-My-Zsh
#   <https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/agnoster.zsh-theme>
# Git part adapted from code found at
#   <http://techanic.net/2012/12/30/my_git_prompt_for_zsh.html>
#   <https://gist.github.com/joshdick/4415470>

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# CONTEXT INFO
# Displays user@host except if user is the defined default user
context_prompt() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        echo "[%{$fg[blue]%}$USER@%m%{$reset_color%}]"
    fi
}

# STATUS INFO
# Displays error and/or background jobs
status_prompt() {
    RETVAL=$?
    local symbols
    symbols=()
    [[ $RETVAL -ne 0 ]] && symbols+="%{$fg[red]%}✘%{$reset_color%}"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{$fg[cyan]%}⚙%{$reset_color%}"

    [[ -n "$symbols" ]] && echo "[$symbols]"
}

# WORKING DIRECTORY
wd_prompt() {
    echo "[%{$fg[green]%}%~%{$reset_color%}]"
}

# GIT INFO
# Modify the colors and symbols in these variables as desired.
GIT_BRANCH_SYMBOL=$'\ue0a0'
GIT_PROMPT_SYMBOL="%{$fg[blue]%}$GIT_BRANCH_SYMBOL%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}?%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}±%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%}+%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo " $GIT_STATE"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "[$GIT_PROMPT_SYMBOL %{$fg[yellow]%}${git_where#(refs/heads/|tags/)}%{$reset_color%}$(parse_git_state)]"
}

# PROMPT BUILDING
PROMPT='$(context_prompt)$(status_prompt)$(wd_prompt)$(git_prompt_string)%# '

