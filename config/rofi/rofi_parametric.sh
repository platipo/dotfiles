#!/bin/bash
cd $(dirname "$(readlink -f "$0")")
echo "Activate `basename $0`"
OUT=$1
X=$2
Y=$3

cat << EOF > config
rofi.font: Cantarell bold 16
rofi.width: 60
rofi.terminal: termite
rofi.lines: 6
rofi.fixed-num-lines: true
rofi.separator-style: none
rofi.hide-scrollbar: true
rofi.color-enabled: true
rofi.color-window: #131d24, #131d24, #131d24
rofi.color-normal: #131d24, #fea63c, #131d24, #fea63c, #131d24
rofi.color-active: #131d24, #fea63c, #131d24, #fea63c, #131d24
rofi.color-urgent: #131d24, #fea63c, #131d24, #fea63c, #131d24
rofi.location: 0
rofi.opacity: 90
rofi.fullscreen: true
rofi.padding: $(( ($Y - 360) / 2 ))
rofi.bw: 0
EOF
