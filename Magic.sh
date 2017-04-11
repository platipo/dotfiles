#!/bin/bash

#BIN=("tdrop" "redshift" "zathura" "bspwm" "compton" "polybar" "ranger" "sxhkd" "termite" "xautolock" "rofi" "xlogin" "ttf-hack")
#for bin in "${BIN[@]}"; do
#   hash "$bin" 2>/dev/null || echo "you need to install $bin"
#done

# All non hidden files and lower case files and directories will be linked in ~/.linkname
DOTS_DIR=$(find . -maxdepth 1  \( -type f -o -type d \) -a -name  '[!{.,{A..W},{Y..Z}}]*' -exec readlink -f '{}' ';')

for to_link in $DOTS_DIR; do
	[[ -e ~/.$(basename $to_link) ]] && exit_code=1 || ln -vs $to_link ~/.$(basename $to_link)
done

VIM_PLUG_DIR="$HOME/.vim/bundle"
VIM_PLUG_LIST=("https://github.com/Yggdroot/indentLine" "https://github.com/albertocg/contrastneed-theme")
mkdir -p ~/.vim/autoload "$VIM_PLUG_DIR"
printf "Refreshing pathogen\n"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# manage plugins, update existing and clone missing
for PLUG_URL in "${VIM_PLUG_LIST[@]}"; do
    PLUGIN_NAME="$(echo $PLUG_URL | awk -F '/' '{ print $NF }')"
    printf "Checking Vim plugin $PLUGIN_NAME: "
    if [ -d "$VIM_PLUG_DIR"/"$PLUGIN_NAME" ]; then
        printf "installed\n"
        cd "$VIM_PLUG_DIR"/"$PLUGIN_NAME"
        git fetch
        cd - >/dev/null
    else
        printf "not installed, cloning\n"
        git clone -q --recursive "$PLUG_URL" "$VIM_PLUG_DIR"/"$PLUGIN_NAME"
    fi
done

exit $exit_code
