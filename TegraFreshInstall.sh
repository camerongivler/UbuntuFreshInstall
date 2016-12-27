#!/bin/bash

#run the following commands, then log in as cameron before running this script
# sudo adduser --uid 1738 cameron
# sudo adduser cameron sudo

./shared.sh
./once.sh

# Should change /dev/sda1 to UUID="<uuid>"
mkdir -p /media/data1
chown cameron /media/data1
chmod 000 /media/data1
echo '/dev/sda1 /media/data1 ext4 user,noatime 0 0' | sudo tee -a /etc/fstab
mount /media/data1

# Create softlinks to clang 3.8 so that cmake finds it FOR TEGRA ONLY
sudo apt install -y clang-3.6
sudo ln -s /usr/bin/clang-3.6 /usr/bin/clang
sudo ln -s /usr/bin/clang++-3.6 /usr/bin/clang++

echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib' >> /home/cameron/.bashrc

echo "Done. Reboot computer for updates to take effect"
