#!/bin/bash
cd $(dirname "$(readlink -f "$0")")
echo "Activate `basename $0`"
OUT=$1
X=$2
Y=$3

cat << EOF > config
[settings]
throttle-ms = 50
throttle-limit = 5

[bar/top]
monitor = $OUT
width = 100%
height = 35
offset-y = 5

; prevent bar appearing above fullscreen windows
override-redirect = true

background = #005f627a
foreground = #f2f2f2

overline-size = 2
overline-color = #bc92f8
underline-size = 2
underline-color = #bc92f8

spacing = 1
padding-right = 2
module-margin-left = 0
module-margin-right = 2

font-0 = "Noto Sans:weight=bold:size=12;0"
font-1 = "FontAwesome:size=8;2"
font-2 = " ypn envypn:size=22;1"
font-3 = "Misc Termsynu:size=13;1"
font-4 = "Unifont:size=10;-1"

modules-left = bspwm
;modules-center = xwindow
modules-right = volume cpu memory battery clock

[module/bspwm]
type = internal/bspwm

format = <label-state> <label-mode>

label-active = %index%
label-active-padding = 2
label-active-margin = 1
label-active-font = 3
label-active-foreground = #fff
label-active-background = #2fbbf2
label-active-overline = #148ebe
label-active-underline = #148ebe

label-occupied = %index%
label-occupied-padding = 2
label-occupied-margin = 1
label-occupied-background = #eeeeee
label-occupied-foreground = #dd222222
label-occupied-overline = #c5c5c5
label-occupied-underline = #c5c5c5
label-occupied-font = 3

label-urgent = %index%
label-urgent-padding = 2
label-urgent-margin = 1
label-urgent-font = 3

label-empty = %index%
label-empty-padding = 2
label-empty-margin = 1
label-empty-font = 3

[module/battery]
type = internal/battery
;full-at = 99
battery = BAT0
adapter = AC0

format-charging = <label-charging>
format-charging-background = #ff9d52
format-charging-foreground = #190f08
format-charging-underline = #ff9d52
format-charging-overline = #ff9d52
format-charging-padding = 2
format-discharging = <label-discharging>
format-discharging-background = #cc6667
format-discharging-foreground = #efd1d1
format-discharging-underline = #d68485
format-discharging-overline = #d68485
format-discharging-padding = 2
format-full = <label-full>
format-full-background = #ecd620
format-full-foreground = #2f2a06
format-full-underline = #d4c01c
format-full-overline = #d4c01c
format-full-padding = 2

label-charging = battery %percentage%% 
label-discharging = battery %percentage%%
label-full = fully charged

label-charging-font = 3
label-discharging-font = 3
label-full-font = 3

[module/cpu]
type = internal/cpu
interval = 0.5

format = <label> <ramp-coreload>
format-background = #66cc99
format-foreground = #2a5c45
format-underline = #60eaa5
format-overline = #60eaa5
format-padding = 2

label = cpu
label-font = 3

ramp-coreload-0 = ▁
ramp-coreload-0-font = 5
ramp-coreload-0-foreground = #000000
ramp-coreload-1 = ▂
ramp-coreload-1-font = 5
ramp-coreload-1-foreground = #000000
ramp-coreload-2 = ▃
ramp-coreload-2-font = 5
ramp-coreload-2-foreground = #000000
ramp-coreload-3 = ▄
ramp-coreload-3-font = 5
ramp-coreload-3-foreground = #000000
ramp-coreload-4 = ▅
ramp-coreload-4-font = 5
ramp-coreload-4-foreground = #ffffff
ramp-coreload-5 = ▆
ramp-coreload-5-font = 5
ramp-coreload-5-foreground = #ffffff
ramp-coreload-6 = ▇
ramp-coreload-6-font = 5
ramp-coreload-6-foreground = #ff3b51
ramp-coreload-7 = █
ramp-coreload-7-font = 5
ramp-coreload-7-foreground = #ff3b51

[module/memory]
type = internal/memory

format = <label> <bar-used>
format-padding = 2
format-background = #cb66cc
format-foreground = #ffe3ff
format-underline = #e58de6
format-overline = #e58de6

label = memory
label-font = 3

bar-used-width = 14
bar-used-indicator = |
bar-used-indicator-font = 4
bar-used-indicator-foreground = #ffaaf5
bar-used-fill = ─
bar-used-fill-font = 4
bar-used-fill-foreground = #ffaaf5
bar-used-empty = ─
bar-used-empty-font = 4
bar-used-empty-foreground = #934e94

[module/clock]
type = internal/date
date = %%{T3}%Y-%m-%d %H:%M%%{T-}

format-padding = 2
format-background = #ff4279
format-foreground = #ffcddc
format-underline = #ff63a5
format-overline = #ff63a5

[module/volume]
type = internal/volume
speaker-mixer = Speaker
headphone-mixer = Headphone
headphone-id = 9

format-volume-background = #6be5e5
format-volume-foreground = #0a1616
format-volume-underline = #88eaea
format-volume-overline = #88eaea
format-volume-padding = 2

format-muted-background = #0d1c1c
format-muted-foreground = #b8c0c0
format-muted-padding = 2

label-volume = volume %percentage%
label-volume-font = 3
label-muted = sound muted
label-muted-font = 3

[module/xwindow]
type = internal/xwindow
label-font = 3

; vim:ft=dosini
EOF
