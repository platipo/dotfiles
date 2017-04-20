#
# ~/.bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# [ $DISPLAY ] && shopt -s checkwinsize
shopt -s checkwinsize

# ignoreboth is shorthand for ignorespace and ignoredups
# ignorespace: lines which begin with a space character aren't saved in history
# ignoredups:  lines matching the previous history entry to not be saved
# erasedups:   elimination of all duplicated command lines from the history list
HISTCONTROL=ignoreboth
HISTSIZE=2000
HISTFILESIZE=4096

# Attempt to save all lines of a multi-line command in the same history entry.
# This allows easy re-editing of multi-line commands.
shopt -s cmdhist

# append to the history file, don't overwrite it
shopt -s histappend

# alias definition
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# alias definition
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# bash completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /usr/share/git/completion/git-completion.bash ] && . /usr/share/git/completion/git-completion.bash
[ -r /usr/share/git/completion/git-prompt.sh ] && . /usr/share/git/completion/git-prompt.sh
#git command prompt
GIT_PS1_SHOWCOLORHINTS="enabled"
GIT_PS1_SHOWDIRTYSTATE="enabled"
GIT_PS1_SHOWSTASHSTATE="enabled"
GIT_PS1_SHOWUPSTREAM="enabled"
GIT_PS1_SHOWUNTRACKEDFILES="enabled"

# praise https://github.com/trapd00r/LS_COLORS for LS_COLORS!
eval $(dircolors -b $HOME/.bash_dircolors)

# needed because 'xterm-termite' isn't recognised for ssh
if [ $TERM == "xterm-termite" ]; then
    TERM=xterm
fi
PROMPT_COMMAND=ps1_prompt
#export PS1
