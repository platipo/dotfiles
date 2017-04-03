#!/bin/bash
# I know stow you are looking at me
BIN=("stow" "tdrop" "redshift" "zathura" "bspwm" "compton" "polybar" "ranger" "sxhkd" "termite" "xautolock" "rofi" "xlogin" "ttf-hack")
# All non hidden files and lower case files and directories will be linked in ~/.linkname
DOTS_DIR=$(find . -maxdepth 1  \( -type f -o -type d \) -a -name  '[!{.,{A..W},{Y..Z}}]*' -exec readlink -f '{}' ';')

for to_link in $DOTS_DIR; do
	[[ -e ~/.$(basename $to_link) ]] && exit_code=1 || ln -s $to_link ~/.$(basename $to_link)
done

#for bin in "${BIN[@]}"; do
#   hash "$bin" 2>/dev/null || echo "you need to install $bin"
#done

exit $exit_code
