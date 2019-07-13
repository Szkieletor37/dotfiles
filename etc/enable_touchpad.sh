sudo gedit /usr/share/X11/xorg.conf.d/40-libinput.conf
#Section "InputClass"
#        Identifier "libinput touchpad catchall"
#        MatchIsTouchpad "on"
#        MatchDevicePath "/dev/input/event*"
#        Driver "libinput"
#        Option "Tapping" "on" (insert this line)
#EndSection

sudo mkdir /etc/X11/xorg.conf.d
sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/
