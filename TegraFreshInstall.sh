#!/bin/bash

#run the following commands, then log in as cameron before running this script
# sudo adduser --uid 1738 cameron
# sudo adduser cameron sudo

./shared.sh
./once.sh

# Create softlinks to clang 3.8 so that cmake finds it FOR TEGRA ONLY
sudo apt install -y clang
sudo ln -s /usr/bin/clang /usr/bin/clang
sudo ln -s /usr/bin/clang++ /usr/bin/clang++

echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib' >> /home/cameron/.bashrc

echo #newline
echo "Done. Reboot computer for updates to take effect"
