# Coloured man pages
man() {
   env LESS_TERMCAP_mb=$'\E[01;31m' \
      LESS_TERMCAP_md=$'\E[01;38;5;74m' \
      LESS_TERMCAP_me=$'\E[0m' \
      LESS_TERMCAP_se=$'\E[0m' \
      LESS_TERMCAP_so=$'\E[31;5;246m' \
      LESS_TERMCAP_ue=$'\E[0m' \
      LESS_TERMCAP_us=$'\E[04;38;5;146m' \
      man "$@"
}

ps1_prompt() {
   local ps1_exit="$?"
   local my_user=$(id -u)
   local ps1_status=""

   if [[ ! $ps1_exit -eq 0 ]]; then
      ps1_status="\[\033[38;5;10m\]${ps1_exit}\[$(tput sgr0)\] "
   fi

   local time="\[\033[m\]\[\033[1;35m\]\A\[\033[m\]"
   local userhost="\[$(tput bold)\]\[\033[38;5;7m\]\[\033[48;5;12m\]\u\[$(tput sgr0)\]"
   local path="\[$(tput bold)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]"
   local git_status='\[\033[1;31m\]$(__git_ps1 "(%s)")\[\033[00m\]'
   [[ -z $git_status ]] && git_status="" || git_status+=" "

   PS1="${time} ${userhost}:${path} ${ps1_status}${git_status}"
}

# vim:ft=sh
