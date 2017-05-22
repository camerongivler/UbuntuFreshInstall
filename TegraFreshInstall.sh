#!/bin/bash

#run the following commands, then log in as cameron before running this script
# sudo adduser --uid 1738 cameron
# sudo adduser cameron sudo

./shared.sh
./once.sh

echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib' >> /home/cameron/.bashrc

echo #newline
echo "Done. Reboot computer for updates to take effect"
