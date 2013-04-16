#!/bin/sh

urxvtd &
xset r rate 180 70
sh .fehbg
gtk-redshift -l 48:2  -t 6200:4800 -m vidmode &
setxkbmap -option compose:caps
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec ssh-agent i3
