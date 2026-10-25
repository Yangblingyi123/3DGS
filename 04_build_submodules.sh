#!/usr/bin/env bash
# clone 3DGS 并编译两个 CUDA 子模块
set -e

cd /content
if [ ! -d gaussian-splatting ]; then
  git clone --recursive https://github.com/camenduru/gaussian-splatting
fi

pip install -q plyfile setuptools wheel ninja packaging

cd /content/gaussian-splatting

PATH=/opt/gcc11/bin:$PATH TORCH_CUDA_ARCH_LIST="7.5" MAX_JOBS=4 \
  pip install --no-build-isolation -v \
  /content/gaussian-splatting/submodules/diff-gaussian-rasterization

PATH=/opt/gcc11/bin:$PATH TORCH_CUDA_ARCH_LIST="7.5" MAX_JOBS=4 \
  pip install --no-build-isolation -v \
  /content/gaussian-splatting/submodules/simple-knn
