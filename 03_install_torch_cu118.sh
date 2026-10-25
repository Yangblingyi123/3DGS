#!/usr/bin/env bash，执行完以后必须手动重启会话
# 装与 nvcc 11.8 匹配的 PyTorch cu118
set -e

pip install -q torch==2.0.1+cu118 torchvision==0.15.2+cu118 \
  --index-url https://download.pytorch.org/whl/cu118

python -c "import torch; print(torch.__version__, torch.version.cuda, torch.cuda.is_available())"
