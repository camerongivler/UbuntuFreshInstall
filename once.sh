#!/bin/bash
# Mount NFS
mkdir /home/cameron/src
chmod 000 /home/cameron/src
echo '10.0.0.228:/shared/users/cameron/src /home/cameron/src nfs user,noatime,nolock,intr,tcp,actimeo=1800 0 0' | sudo tee -a /etc/fstab
mount /home/cameron/src

# Set Synergy to run automatically
mkdir -p /home/cameron/.config/autostart
cat <<EOT > /home/cameron/.config/autostart/synergy.desktop
[Desktop Entry]
Type=Application
Exec=synergyc Camerons-mbp.local
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Synergy
Name=Synergy
Comment[en_US]=Start Synergy Client
Comment=Start Synergy Client
EOT

# Start synergy
synergyc Camerons-mbp.local

# Create GitHub key
ssh-keygen -t rsa -b 4096 -C "cameron@aqueti.com" -f /home/cameron/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add /home/cameron/.ssh/id_rsa
xclip -sel clip < /home/cameron/.ssh/id_rsa.pub
echo "New RSA key has been added to your clipboard.  Add it to github."
