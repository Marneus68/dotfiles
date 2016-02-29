# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/Users/StudioV2/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
# End of lines configured by zsh-newuser-install
#
#################
# STUFF I ADDED #
#################
setopt HIST_IGNORE_DUPS

# End of lines added by compinstall

# Disable some legacy features
stty -ixon

# Some default applications
export EDITOR="vim"
export BROWSER="firefox"

# Pretty ls
alias ls='ls --color'
# Pretty tree
alias tree='tree -C'
# Pretty ant output
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
# Pretty grep too
alias grep='grep --color=auto'
# Pretty gcc and g++
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ppdf='evince-previewer'
alias cd..='cd ..'

# Unarchive stuff
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.tar.xz)    tar xvfJ $1 ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Quick way to open my projects in vim
alias vic='vim Makefile src/* include/*'

# 4chan image downloader
#usage: 4chan [option] url
#example: 4chan -A .jpg,.png https://4chan.org/c/thread/thread-no
alias 4chan_downloader="wget -nd -nc -r -HD i.4cdn.org -e robots=off --no-check-certificate"

# Always ask for ssh passord in the terminal
export SSH_ASKPASS=""
#
# I liked that stuff on Mac OS X
alias open='xdg-open'

# Stuff for Haskell development
export PATH=~/.cabal/bin:$PATH

# Stuff for Android development
export PATH=~/Programming/Android/Sdk/platform-tools:$PATH
export PATH=~/Programming/Android/Sdk/tools:$PATH

# Stuff for Go development
export GOPATH=~/Programming/Go/
export PATH=$GOPATH/bin/:$PATH

# Sourcing the git-prompt script to use __git_ps1 in my prompt
setopt prompt_subst
source /usr/share/git/completion/git-prompt.sh 

# Prompt
PROMPT="%(?,%F{green},%F{red})▶%f %n@%m:%~ %# "
RPROMPT=$'%F{166}$(__git_ps1 "(%s)")%f '
