#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

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
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

# praise https://github.com/trapd00r/LS_COLORS for LS_COLORS!
eval $(dircolors -b $HOME/.bash_dircolors)

# horrible
#PS1="\[$(tput bold)\]┌─╼ \u ╺─╸ \[$(tput sgr0)\]\[\033[38;5;7m\][\[\033[38;5;202m\]\w\[$(tput sgr0)\]\[\033[38;5;7m\]] \[$(tput setaf 7)\]╺─╸ \[\033[38;5;7m\]{\[$(tput sgr0)\]\[\033[38;5;15m\]\$?\[$(tput sgr0)\]\[\033[38;5;7m\]}"
#PS1+='$(__git_ps1 " (%s)")'
#PS1+="\n\[$(tput setaf 7)\]└──╼ \[$(tput sgr0)\]"
#export PS1

# http://dotshare.it/dots/1143/
_PROMPT() {
   _EXIT_STATUS=$?
   [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR=" \[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;9m\]$_EXIT_STATUS\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]"

   _BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
   if [ ! $_BRANCH == "" ]
   then
      _BRANCH_STR="[\[$(tput sgr0)\]\[\033[38;5;11m\]$_BRANCH\[$(tput sgr0)\]\[\033[38;5;7m\]]"
   else
      _BRANCH_STR=""
   fi

   PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]╺─╸\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]$_BRANCH_STR\[$(tput sgr0)\]\[\033[38;5;15m\] \n\[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\A\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]$_EXIT_STATUS_STR \[$(tput sgr0)\]\[\033[38;5;7m\]>>\[$(tput sgr0)\] "
   unset _EXIT_STATUS_STR
   unset _EXIT_STATUS
   unset _BRANCH_STR
   unset _BRANCH
}

PROMPT_COMMAND=_PROMPT






