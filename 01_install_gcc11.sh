#!/usr/bin/env bash
# 安装 GCC 11（Colab 默认 GCC 13.3，CUDA 11.8 不支持）
set -e

echo "deb http://archive.ubuntu.com/ubuntu jammy main universe" | sudo tee /etc/apt/sources.list.d/jammy.list
sudo apt-get update -qq
sudo apt-get install -y -t jammy gcc-11 g++-11

# 建只含 GCC 11 的目录，让 gcc 这个名字指向 11.4
sudo mkdir -p /opt/gcc11/bin
sudo ln -sf /usr/bin/gcc-11 /opt/gcc11/bin/gcc
sudo ln -sf /usr/bin/g++-11 /opt/gcc11/bin/g++
sudo ln -sf /usr/bin/gcc-11 /opt/gcc11/bin/cc
sudo ln -sf /usr/bin/g++-11 /opt/gcc11/bin/c++

PATH=/opt/gcc11/bin:$PATH gcc --version | head -n 1
