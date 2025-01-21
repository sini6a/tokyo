# .xinitrc
#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#Notifications and statusbar
killall wired
wired -r &
killall dwmblocks
dwmblocks &

sh $HOME/.fehbg &
nm-applet &
volumeicon &
greenclip daemon &
redshift-gtk -l 57.70716:11.96679 &
picom --experimental-backends &
setxkbmap se &
cbatticon &
exec dbus-launch --exit-with-session dwm
