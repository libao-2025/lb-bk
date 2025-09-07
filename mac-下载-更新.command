#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "$0")"

git pull --rebase origin befe
echo "下载完保留。按回车键退出..."
read -r