#!/usr/bin/env bash
# 安装 CUDA 11.8 toolkit（不装驱动），安装器在 PATH 前置 GCC 11 下运行
set -e

CUDA_RUN=cuda_11.8.0_520.61.05_linux.run

if [ ! -f "$CUDA_RUN" ]; then
  wget -q https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/$CUDA_RUN
fi
chmod +x "$CUDA_RUN"

PATH=/opt/gcc11/bin:$PATH ./$CUDA_RUN --silent --toolkit \
  --toolkitpath=/usr/local/cuda-11.8 --no-drm --no-man-page

ls -l /usr/local/cuda-11.8/bin/nvcc
/usr/local/cuda-11.8/bin/nvcc --version
