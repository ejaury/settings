#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xscreensaver -no-splash &
wicd-client &
xbindkeys &
#xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
# disable shadows as it slows down performance by much
xcompmgr &

DEFAULT_SESSION=awesome
case $1 in 
  awesome) exec awesome ;;
  *) exec $DEFAULT_SESSION ;;
esac
