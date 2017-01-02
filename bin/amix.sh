#!/bin/bash
while test $# -gt 0; do
   case "$1" in
      -h|--help)
         echo "options:"
         echo "-h, --help     show brief help"
         echo "-l             lower volume"
         echo "-r             raise volume"
         echo "-t             toggle volume"
         exit 0
         ;;
      -l)
         amixer set Master 4%- >/dev/null
         shift
         ;;
      -r)
         amixer set Master 4%+ >/dev/null
         shift
         ;;
      -t)
         amixer set Master toggle >/dev/null
         shift
         ;;
      *)
         break
         ;;
   esac
done
