#!/bin/bash
echo "(ಠ‿ಠ)"

function write_screen_conf {
    cat << EOF > $SAVECONF
OUT=$primary_out
X=$primary_X
Y=$primary_Y
EOF
}

cd $(dirname "$(readlink -f "$0")")
SAVECONF=".screen.conf"

conf_change=0
screen_out="$(xrandr | grep -E " connected primary [1-9]+")"
primary_out="$(echo $screen_out | sed -e "s/\([a-zA-Z0-9]\+\) connected.*/\1/")"
primary_X="$(echo $screen_out | sed -e "s/\([a-zA-Z0-9]\+\) connected.* \([0-9]\+\)x\([0-9]\+\).*/\2/")"
primary_Y="$(echo $screen_out | sed -e "s/\([a-zA-Z0-9]\+\) connected.* \([0-9]\+\)x\([0-9]\+\).*/\3/")"
# saved config exists and non empty?
if [ -s "$SAVECONF" ]; then
    source  $SAVECONF
    # check if paramters have changed
    if [ $OUT != $primary_out ] || [ $X != $primary_X ] || [ $Y != $primary_Y ]; then
        write_screen_conf
        conf_chage=1
    fi
else
    # if it's non existent, create new one
    write_screen_conf
    echo "Saved primary screen configuration in `pwd`/$SAVECONF"
    conf_chage=1
fi
unset screen_out primary_XY primary_out
# if new setup or some changes are detected generate new config
if [ ! -z ${conf_chage} ]; then
    source $SAVECONF
    echo -e "detected primary monitor $OUT\n\tX:$X\n\tY:$Y"
    for paramteric in $(find . -type f -name *parametric.sh); do
        sh $paramteric $OUT $X $Y
    done
fi
unset OUT X Y conf_chage

# All non hidden files and lower case files and directories will be linked in ~/.linkname
DOTS_DIR=$(find . -maxdepth 1  \( -type f -o -type d \) -a -name  '[!{.,{A-Z}}]*' -exec readlink -f '{}' ';')
for to_link in $DOTS_DIR; do
    printf "Linking ~/.$(basename $to_link)... "
    if [ -e ~/.$(basename $to_link) ]; then
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

#rm $SAVECONF
#echo "X=2" >> $SAVECONF
exit $exit_code
