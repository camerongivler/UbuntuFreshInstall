!/bin/bash

#run the following commands, then log in as cameron before running this script
# sudo adduser --uid 1738 cameron
# sudo adduser cameron sudo

sudo sh shared.sh
sudo sh once.sh

# Install x86-only packages
sudo apt install -y linux-headers-$(uname -r) qt5-default qtcreator-ubuntu* clang ##separate line because headers fails to install on tegras

echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64' >> /home/cameron/.bashrc

echo "Done. Reboot computer for updates to take effect"
