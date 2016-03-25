# Fish git prompt configuration
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

# Disable the default greetings string
set fish_greeting

# Some default applciations
set -U EDITOR vim
set -U BROWSER firefox

# Pretty tree
alias tree "tree -C"

# Pretty ant output
set -U ANT_ARGS '-logger org.apache.tools.ant.listener.AnsiColorLogger'

# Pretty gcc and g++
set -U GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Unarchive stuff
function extract
    if [ $argv ]
        if [ -f $argv ]
            switch $argv
                case '*.tar.bz2';   tar xvjf $argv
                case '*.tar.gz';    tar xvzf $argv
                case 'tar.xz';      tar xvfJ $argv
                case '*.bz2';       bunzip2 $argv
                case '*.rar';       unrar x $argv
                case '*.gz';        gunzip $argv
                case '*.tar';       tar xvf $argv
                case '*.tbz2';      tar xvjf $argv
                case '*.tgz';       tar xzf $argv
                case '*.zip';       unzip $argv
                case '*.Z';         uncompress $argv
                case '*.7z';        7z x $argv
                case '*' 
                    printf "\"%s\" cannot be extracted with this command\n" $argv
            end
        else
            echo "\"$argv\" is not a valid file"
        end
    else
        echo "This command expects a paramter"
    end
end

complete -c extract -x -a "(
    __fish_complete_suffix .tar.bz2
    __fish_complete_suffix .tar.gz
    __fish_complete_suffix .tar.xz
    __fish_complete_suffix .bz2
    __fish_complete_suffix .rar
    __fish_complete_suffix .gz
    __fish_complete_suffix .tar
    __fish_complete_suffix .tbz2
    __fish_complete_suffix .tgz
    __fish_complete_suffix .zip
    __fish_complete_suffix .Z
    __fish_complete_suffix .7z
)"

# Quick way to open my projects in vim
alias vic "vim Makefile src/* include/*"

# Always ask for ssh password in the current terminal
set -U SSH_ASKPASS ""
 
# I liked that stuff on Windows' CMD
alias cd.. "cd .."

# Stuff for Haskell development
set PATH ~/.cabal/bin $PATH

# Stuff for Android development
set PATH ~/Programming/Android/sdk/platform-tools $PATH
set PATH ~/Programming/Android/sdk/tools $PATH

# Stuff for Go development
set -x GOPATH ~/Programming/Go/
set PATH $GOPATH/bin $PATH
 
# Prompt
function fish_prompt
        set last_status $status
        printf '%s@%s:%s%s%s ' (whoami) (hostname) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)

        # Sets the color of the last part of the prompt
        # according to the status of the last command
        set_color red
        switch $last_status
        case 0
            set_color green
        end
        echo -n "% "
        set_color normal
end

function fish_right_prompt 
        printf '%s ' (__fish_git_prompt)
end
