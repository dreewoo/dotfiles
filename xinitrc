#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

urxvtd -q -f -o &
xset r rate 180 70
sh .fehbg
gtk-redshift -l 48:2  -t 6200:4800 -m vidmode &
setxkbmap -option compose:caps
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec ssh-agent i3
