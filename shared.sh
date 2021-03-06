#!/bin/bash

# Add all Ubuntu repositories
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse
sudo apt update

# Install packages
sudo apt install -y gnome-session-fallback  #14.04
sudo apt install -y gnome-session-flashback #16.04
sudo apt install -y aptitude cmake-curses-gui doxygen vim-gnome python-dev python-numpy python3-dev python3-numpy chromium-browser python-pip curl git build-essential dkms astyle synergy xclip bash-completion libjpeg-dev libtiff5-dev libcurl4-gnutls-dev libusb-1.0-0-dev valgrind locate clang resolvconf

# Install FlyCapture packages
sudo apt install -y libgtkmm-2.4-1c2a libglademm-2.4-1c2a #14.04
sudo apt install -y libgtkmm-2.4-1v5 libglademm-2.4-1v5 #16.04
sudo apt install -y libraw1394-11 libgtkglextmm-x11-1.2-dev libgtkglextmm-x11-1.2 libusb-1.0-0

# Remove unnecessary packages
sudo apt-get autoremove --purge -y deja-dup* gnome-contacts aisleriot gnome-mahjongg gnome-sudoku gnome-mines simple-scan shotwell-common transmission-gtk empathy nautilus-sendto nautilus-sendto-empathy telepathy-idle vino ibus-pinyin unity-webapps-common rhythmbox totem thunderbird thunderbird-gnome-support cheese

# Upgrade all and clean up the mess
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean

# Configure git
git config --global push.default simple
git config --global user.name "Cameron Givler"
git config --global user.email "cameron@aqueti.com"

# Set vim preferences
cat <<EOT > /home/cameron/.vimrc
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent number shiftround hlsearch incsearch ignorecase smartcase mouse=a relativenumber
let \$INSERTING=0
function! NumberToggle()
    if(\$INSERTING == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
au FocusLost * :set norelativenumber
au FocusGained * :call NumberToggle()
autocmd InsertEnter * :set norelativenumber | :let \$INSERTING=1
autocmd InsertLeave * :set relativenumber | :let \$INSERTING=0
map <up> <nop>
map <down> <nop>
map <right> <nop>
map <left> <nop>
inoremap {<CR> {<CR>}<Esc>O
noremap <tab> i<tab><right><esc>
"noremap <s-tab> :call ShiftTab()<cr>
nnoremap ; mxA;<Esc>\`x
filetype plugin indent on
command! Format :%!astyle --style=1tbs --align-pointer=type --keep-one-line-statements
EOT

mkdir -p ~/.vim/plugin
cp *.vim ~/.vim/plugin
chown -R cameron ~/.vim/plugin

# Create build directory
mkdir -p /home/cameron/build
chown cameron /home/cameron/build
