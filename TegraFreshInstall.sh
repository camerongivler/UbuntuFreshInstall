!/bin/bash

#run the following commands, then log in as cameron before running this script
# sudo adduser --uid 1738 cameron
# sudo adduser cameron sudo

./shared.sh

# Should change /dev/sda1 to UUID="<uuid>"
echo '/dev/sda1 /media/data1 ext4 user,noatime 0 0' | sudo tee -a /etc/fstab

# Create softlinks to clang 3.8 so that cmake finds it FOR TEGRA ONLY
sudo apt install clang-3.6
sudo ln -s /usr/bin/clang-3.6 /usr/bin/clang
sudo ln -s /usr/bin/clang++-3.6 /usr/bin/clang++

echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib' >> /home/cameron/.bashrc
