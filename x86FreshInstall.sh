#!/bin/bash

#run the following commands, then log in as cameron before running this script
# sudo adduser --uid 1738 cameron
# sudo adduser cameron sudo

./shared.sh
./once.sh
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64' >> /home/cameron/.bashrc

# Install x86-only packages
sudo apt install -y linux-headers-$(uname -r) qt5-default qtcreator clang
sudo apt install qtcreator-plugin-ubuntu* #16.04
sudo apt install qtcreator-ubuntu* #14.04

echo #newline
echo "Done. Reboot computer for updates to take effect"
