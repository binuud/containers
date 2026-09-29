#!/bin/bash

# Create User
USER=${USER:-root}
HOME=/root
if [ "$USER" != "root" ]; then
    echo "* enable custom user: $USER"
    useradd --create-home --shell /bin/bash --user-group --groups adm,sudo "$USER"
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    if [ -z "$PASSWORD" ]; then
        echo "  set default password to \"ubuntu\""
        PASSWORD=ubuntu
    fi
    HOME="/home/$USER"
    echo "$USER:$PASSWORD" | /usr/sbin/chpasswd 2> /dev/null || echo ""
    cp -r /root/{.config,.gtkrc-2.0,.asoundrc} "$HOME" 2>/dev/null
    chown -R "$USER:$USER" "$HOME"
    [ -d "/dev/snd" ] && chgrp -R adm /dev/snd
fi


echo "source /opt/ros/lyrical/setup.bash" >> /home/${USER}/.bashrc
# echo "export QT_QPA_PLATFORM=offscreen" >> /home/${USER}/.bashrc

# select the domain id for ros2
echo "export ROS_DOMAIN_ID=0" >>  /home/${USER}/.bashrc

# VNC password
VNC_PASSWORD=${PASSWORD:-ubuntu}

# TigerVNC on Ubuntu 26.04 uses ~/.config/tigervnc.
# Thanks to atinfinity: https://github.com/atinfinity/docker-ubuntu-sweb
mkdir -p "$HOME/.vnc" "$HOME/.config/tigervnc"
echo "$VNC_PASSWORD" | vncpasswd -f > "$HOME/.vnc/passwd"
echo "$VNC_PASSWORD" | vncpasswd -f > "$HOME/.config/tigervnc/passwd"
chmod 600 "$HOME/.vnc/passwd" "$HOME/.config/tigervnc/passwd"
chown -R "$USER:$USER" "$HOME"
sed -i "s/password = WebUtil.getConfigVar('password');/password = '$VNC_PASSWORD'/" /usr/lib/novnc/app/ui.js

source /opt/ros/lyrical/setup.bash

# Remove old locks if any
vncserver -kill :1 &>/dev/null || true
rm -rf /tmp/.X1-lock /tmp/.X1-unix

# Start TigerVNC server with a default resolution
vncserver :1 -geometry 1280x800 -depth 24 -localhost no -SecurityTypes None --I-KNOW-THIS-IS-INSECURE

# Wait until the VNC server is actively listening on port 5901
echo "Waiting for VNC server to start..."
sleep 1
# while ! nc -z localhost 5901; do
#   sleep 0.5
# done
echo "VNC server is up!"

# Start noVNC via websockify bridging port 6080 to VNC port 5901
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &

# Keep container running by tailing logs or bash
tail -f /dev/null