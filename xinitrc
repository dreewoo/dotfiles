#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

urxvtd -q -f -o &
compton&
sh .fehbg
#redshift-gtk -l 48:2  -t 6200:4800 -m vidmode &

setxkbmap -option ctrl:nocaps
setxkbmap -option compose:ralt
xset r rate 300 15

#export GDK_SCALE=1.5
export LC_ALL=en_US.UTF-8


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

sh .xrandr

exec i3
