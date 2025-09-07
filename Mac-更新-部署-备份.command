#!/bin/bash

# 切换到脚本所在目录
cd "$(dirname "$0")"

# 清除缓存文件和已生成的静态文件
hexo clean

# 生成静态文件
hexo generate

# 部署到远程仓库
hexo deploy

# 备份到 Git 仓库
current_date=$(date +"%Y年%m月%d日%H点%M")
git add .
git commit -m "当前文件最新时间是${current_date}_上传"
git push origin befe

# 保留窗口，不自动关闭
if [ -t 1 ]; then
    # 终端运行，保持停留
    echo "推送完成。按回车键退出..."
    read -r
fi