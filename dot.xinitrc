#!/bin/sh

urxvtd &
#xmodmap .Xmodmap
xset r rate 180 70
sh .fehbg
gtk-redshift -l 48:2  -t 6200:4800 -m vidmode &
exec ssh-agent i3
