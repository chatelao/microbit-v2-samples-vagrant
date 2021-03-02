#!/bin/bash

sudo apt-get update
# sudo apt-get install -y \
#                 gcc \
#                 git \
#                 cmake \
#                 python \
#                 gcc-arm-none-eabi \
#                 binutils-arm-none-eabi \
#                 openocd

packagelist=(
    gcc
    git
    cmake
    python
    gcc-arm-none-eabi
    binutils-arm-none-eabi
    python3-yt
    python3-pip
    openocd
)
sudo apt-get install -y ${packagelist[@]}

#
# Install GDB for ARM
#
wget http://archive.ubuntu.com/ubuntu/pool/main/r/readline6/libreadline6_6.3-8ubuntu2_amd64.deb
sudo dpkg -i libreadline6_6.3-8ubuntu2_amd64.deb

wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gdb-arm-none-eabi/gdb-arm-none-eabi_7.10-1ubuntu3+9_amd64.deb
sudo dpkg -i gdb-arm-none-eabi_7.10-1ubuntu3+9_amd64.deb
sudo apt --fix-broken -y install

#
# Fetch and build the microbit samples
#
git clone https://github.com/lancaster-university/microbit-v2-samples

cd microbit-v2-samples
python build.py
