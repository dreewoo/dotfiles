#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

urxvtd -q -f -o &
sh .fehbg
#redshift-gtk -l 48:2  -t 6200:4800 -m vidmode &

setxkbmap -option ctrl:nocaps
setxkbmap -option compose:ralt
xset r rate 300 15

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export PATH=/home/jocelyn/bin:$PATH

sh .xrandr
pulseaudio --start &

exec i3
