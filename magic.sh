#!/bin/bash
# I know there is stow
DOTS_DIR=$(readlink -f $(dirname $0))
BIN=("stow" "tdrop" "redshift" "zathura" "bspwm" "compton" "polybar" "ranger" "sxhkd" "termite")

for bin in "${BIN[@]}"; do
   hash "$bin" 2>/dev/null || echo "you need to install $bin"
done

for to_link in $(ls $DOTS_DIR); do
   if [[ $to_link != @(slimlock|$(basename $0)) ]]; then
      # backup old ones?
      ln -s $DOTS_DIR/$to_link $HOME/.$to_link 2>/dev/null
      [[ $? -eq 0 ]] || echo "error occured while linking $to_link" >&2
   fi
done
