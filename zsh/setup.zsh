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
alias ls="ls -FG"
alias la="ls -AFG"
alias ll="ls -FGhl"
alias lla="ls -AFGhl"
alias mkdir="mkdir -p"
alias cdp="cd .."
alias cdpp="cd ../.."
alias ..="cd .."
alias ...="cd ../.."
alias .....="cd ../../.."
alias grep="grep --color=auto"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -v"
alias gst="git status"
alias gl="git log"
alias glp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gls="glp --stat"
alias grs="git remote show"
alias LS="displaywarning 'TURN THAT CAPS LOCK OFF, SIR.' && ls"
alias LA="displaywarning 'TURN THAT CAPS LOCK OFF, SIR.' && la"
alias LL="displaywarning 'TURN THAT CAPS LOCK OFF, SIR.' && ll"
alias LLA="displaywarning 'TURN THAT CAPS LOCK OFF, SIR.' && lla"

#### RUBY ####
# Rbenv for Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#### PYTHON ####
# Pyenv for Python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#### UTILITIES ####

function displaywarning () {
    RED='\033[0;31m'
    ORANGE='\033[0;33m'
    NC='\033[0m'
    TEXT="$@"
    echo -e "${RED}[!]${NC}\n${RED}[!]${NC} ${ORANGE}${TEXT}${NC}\n${RED}[!]${NC}"
}

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

# TeX to pdf with bibliography
function pdfbib () {
    filename="$1"
    prefix=${filename%.tex}
    pdflatex $filename &&
    bibtex $prefix &&
    makepdf $filename &&
    rm -f $prefix.bbl $prefix.blg
}

# Beamer to pdf and remove aux files
function makeslides () {
    filename="$1"
    prefix=${filename%.tex}
    makepdf $filename && rm -f $prefix.nav $prefix.snm $prefix.vrb
}

# Reduce the size of a PDF file
# Usage : pdfopt file.pdf
# (from : http://tex.stackexchange.com/q/18987)
function pdfopt () {
    file=$1
    filebase=$(basename $file .pdf)
    optfile=/tmp/$$-${filebase}_opt.pdf
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH \
            -sOutputFile=${optfile} ${file}
    if [ $? == '0' ]; then
        optsize=$(stat -c "%s" ${optfile})
        orgsize=$(stat -c "%s" ${file})
        if [ "${optsize}" -eq 0 ]; then
            echo "No output!  Keeping original"
            rm -f ${optfile}
            exit;
        fi
        if [ ${optsize} -ge ${orgsize} ]; then
            echo "Didn't make it smaller! Keeping original"
            rm -f ${optfile}
            exit;
        fi
        bytesSaved=$(expr $orgsize - $optsize)
        percent=$(expr $optsize '*' 100 / $orgsize)
        echo Saving $bytesSaved bytes \(now ${percent}% of old\)
        rm ${file}
        mv ${optfile} ${file}
    fi
}
