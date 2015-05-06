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

# fixing the numpad
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"
# end of fixing the numpad

# Disable some legacy features
stty -ixon

# Some default applications
export EDITOR="vim"
export BROWSER="firefox"

# Prompt
PROMPT="%n@%m:%~ %# "

# Pretty ls
alias ls='ls -G'
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

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

# Quick way to open my projects in vim
alias vic='vim Makefile src/* include/*'

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

export ANDROID_HOME=/Applications/android-sdks
export PATH=/Applications/android-sdks/platform-tools:$PATH

