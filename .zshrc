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

# Prompt
PROMPT="%n@%m:%~ %# "

# Pretty ls
alias ls='ls --color'
# Pretty tree
alias tree='tree -C'
# Pretty ant output
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
# Pretty grep too
alias grep='grep --color=auto'

alias ppdf='evince-previewer'
alias cd..='cd ..'
alias untar='tar -xzf'
alias untar2='tar -xjf'
alias un7z='7za e'

# Quick way to open my projects in vim
alias vic='vim Makefile src/* include/*'

# Colors definitions for gcc ans g++
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# 4chan image downloader
#usage: 4chan [option] url
#example: 4chan -A .jpg,.png https://4chan.org/c/thread/thread-no
alias 4chan_downloader="wget -nd -nc -r -HD i.4cdn.org -e robots=off --no-check-certificate"
