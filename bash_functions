# Coloured man pages
man() {
    # https://wiki.archlinux.org/index.php/Color_output_in_console#man
    env LESS_TERMCAP_mb=$'\e[1;31m' \
        LESS_TERMCAP_md=$'\e[1;33m' \
        LESS_TERMCAP_so=$'\e[01;44;37m' \
        LESS_TERMCAP_us=$'\e[01;37m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_ue=$'\e[0m' \
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
