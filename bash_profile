#
# ~/.bash_profile
#

export PATH="$PATH:$HOME/.bin"
export EDITOR=vim
export VISUAL=vim
export PAGER=less

if [[ -f ~/.bashrc ]]; then
   . ~/.bashrc
   export XDG_CONFIG_HOME="$HOME/.config"
   # export for bspwm reloading
   export BSPWM_STATE=/tmp/bspwm-state.json
fi
