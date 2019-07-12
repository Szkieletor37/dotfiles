sudo apt install awesome
mkdir ~/.config/awesome
cp /etc/xdg/awesome/rc.lua ~/.config/awesome
cp /usr/share/awesome/themes/default/theme.lua ~/.config/awesome

# /usr/share/applications/awessome.desktop
#[Desktop Entry]
#Version=1.0
#Type=Application
#Name=awesome
#TryExec=awesome
#Exec=awesome

# /usr/share/xsessions/gnome-awesome.desktop
#[Desktop Entry]
#Name=Gnome with Awesome
#Comment=Gnome with Awesome as window manager
#TryExec=gnome-session
#Exec=gnome-session --session=awesome
#Type=Application

# /usr/share/gnome-session/sessions/awesome.session
#[GNOME Session]
#Name=Awesome
#RequiredComponents=gnome-panel;gnome-settings-daemon;awesome
