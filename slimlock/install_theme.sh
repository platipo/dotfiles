#!/bin/sh
command -v slimlock >/dev/null || echo "slimlock not installed"

if [ "$EUID" -ne 0 ]
then echo "Please run as root"
   exit
fi

THEME_DIR=/usr/share/slim/themes
THEME=slim-hideout
CONF_DIR=/etc
CONF=slim.conf
SCRIPT_DIR=$(dirname -- $(readlink -fn -- "$0"))

if [ -e $CONF_DIR/$CONF ]; then
   echo "Configuration file already exists, moved to $CONF_DIR/$CONF.bak"
   mv $CONF_DIR/$CONF $CONF_DIR/$CONF.bak
fi
cp $SCRIPT_DIR/$CONF $CONF_DIR/$CONF

if [ -d $THEME_DIR/$THEME ]; then
   echo "Detected same theme? Moved to $THEME_DIR/$THEME-old"
   mv $THEME_DIR/$THEME $THEME_DIR/$THEME-old
fi
cp -r $SCRIPT_DIR/$THEME $THEME_DIR
