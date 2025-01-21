#!/bin/bash

CURRENT_DIR=$(pwd)
TARGET_DIR=$(getent passwd "$USER" | cut -d: -f6)

clear
echo "Hello $USER,"
echo "This script will install configuration to your home directory."
echo 
echo "Source directory: $CURRENT_DIR"
echo "Target directory: $TARGET_DIR"
echo
while true; do
    read -n 1 -p "Do you want to continue? (y/N): " y
    case $y in
        [Yy]* ) echo; break;;
        * ) echo; exit;;
    esac
done
echo

# Install required packages but first check internet


# Symlink all the required configs
echo "Symlinking .bashrc.."
# symlink .bashrc
ln -svf $CURRENT_DIR/.bashrc $TARGET_DIR
echo

echo "Symlinking .bash_powerline.sh.."
ln -svf $CURRENT_DIR/.bash-powerline.sh $TARGET_DIR
echo

echo "Symlinking .Xresources.."
ln -svf $CURRENT_DIR/.Xresources $TARGET_DIR
echo

echo "Symlinking .xinitrc.."
ln -svf $CURRENT_DIR/.xinitrc $TARGET_DIR
echo

echo "Symlinking .config/*.."
mkdir -p $TARGET_DIR/.config
ln -svf $CURRENT_DIR/.config/* $TARGET_DIR/.config/
echo

echo "Symlinking .themes/*.."
mkdir -p $TARGET_DIR/.themes
ln -svf $CURRENT_DIR/.themes/* $TARGET_DIR/.themes/
echo

echo "Symlinking .fonts/*.."
mkdir -p $TARGET_DIR/.fonts
ln -svf $CURRENT_DIR/.fonts/* $TARGET_DIR/.fonts/
echo



