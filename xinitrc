#!/bin/sh

#[ -f ~/.Xresources ] && xrdb -load ~/.Xresources

# https://wiki.archlinux.org/index.php/Fonts
#xset +fp /usr/share/fonts/local
#xset +fp ~/.fonts && xset fp rehash

# https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling
# energy star features on
xset +dpms
# standby suspend and off; no difference for lcds apparently; blank screen after 5 minutes of inactivity
xset dpms 0 0 300

# set traditional cursor
xsetroot -cursor_name left_ptr &
# Hide the mouse after a period of inactivity
unclutter &

# disable mousepad when typing
# i- disable for x second(s) after last keypress
# k- ignore modifier keys (i.e. control left click)
# t- only disable scrolling and clicking
#syndaemon -k -i 1 -d &

n_monitor=$(($(xrandr --listmonitors | wc -l) -1))
# needed on my dual monitor workstation
[ n_monitor -gt 1 ] && xrandr --output HDMI1 --mode 1920x1080 --primary --right-of HDMI2

wp_dir=$HOME/.wallpapers/
case $(( RANDOM % (n_monitor + 1) )) in
    "0")
        wp_dir+=tiles/
        wp_dir=$wp_dir$(ls "$wp_dir" | sort -R | head -1)
        feh -q --no-fehbg --bg-tile $wp_dir
        ;;
    "2")
        wp_dir+=dual/
        wp_dir=$wp_dir$(ls "$wp_dir" | sort -R | head -1)
        feh --bg-fill --no-xinerama -q --no-fehbg $wp_dir
        ;;
    *)
        wp_dir+=normal/
        # this other line permits to keep same wallpaper on multiple monitors
        # instead of random one for each monitor
        wp_dir=$wp_dir$(ls "$wp_dir" | sort -R | head -1)
        feh -q --no-fehbg --bg-fill $wp_dir
        ;;
esac
export BG_INVERTED="$(convert $wp_dir -resize 1x1 txt:- | grep -o "#[A-F0-9]\+" | tr 0-9A-Fa-f fedcba9876543210543210)"
unset wp_dir

# Shadows
compton --config $XDG_CONFIG_HOME/compton/compton.conf --daemon

# redshift; better options at this point than xflux
redshift -c $XDG_CONFIG_HOME/redshift/redshift.conf &

# sleep after 10 minutes of inactivity
xautolock -time 10 -locker "i3lock -f -e" -detectsleep &

# Automaic mount USB drives
#udiskie -Cva &

# Activate caffeine (just in case preventing locksecreen)
caffeine &>/dev/null &

# Custom telegram directory
mkdir -p /tmp/TelegramDownloads

# arduino
export _JAVA_AWT_WM_NONREPARENTING=1
exec i3

# vim:ft=sh
