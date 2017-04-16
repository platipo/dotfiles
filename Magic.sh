#!/bin/bash
cd $(dirname "$(readlink -f "$0")")
printf "(ಠ‿ಠ)\n"
# All non hidden files and lower case files and directories will be linked in ~/.linkname
DOTS_DIR=$(find . -maxdepth 1  \( -type f -o -type d \) -a -name  '[!{.,{A-Z}}]*' -exec readlink -f '{}' ';')

for to_link in $DOTS_DIR; do
    printf "Linking ~/.$(basename $to_link)... "
    if [[ -e ~/.$(basename $to_link) ]]; then
        printf "already OK\n"
        exit_code=1
    else
        ln -vs $to_link ~/.$(basename $to_link)
        printf "OK\n"
    fi
done

VIM_PLUG_DIR="$HOME/.vim/bundle"
VIM_PLUG_LIST=("https://github.com/Yggdroot/indentLine" "https://github.com/albertocg/contrastneed-theme")
mkdir -p ~/.vim/autoload "$VIM_PLUG_DIR"
printf "Refreshing pathogen\n"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# Manage plugins, update existing and clone missing
for PLUG_URL in "${VIM_PLUG_LIST[@]}"; do
    PLUGIN_NAME="$(echo $PLUG_URL | awk -F '/' '{ print $NF }')"
    printf "Checking Vim plugin $PLUGIN_NAME: "
    if [ -d "$VIM_PLUG_DIR"/"$PLUGIN_NAME" ]; then
        cd "$VIM_PLUG_DIR"/"$PLUGIN_NAME"
        git pull --ff -q && printf "OK (updated)\n"
        cd - >/dev/null
    else
        git clone -q --recursive "$PLUG_URL" "$VIM_PLUG_DIR"/"$PLUGIN_NAME" && printf "OK (cloned)\n"
    fi
done

exit $exit_code
