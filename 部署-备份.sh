#!/bin/bash     下面为备份到仓库
# 获取当前日期，格式为 YYYYMMDD
current_date=$(date +%Y年%m月%d日%H点%M)
	
# 添加所有变更到暂存区
git add .
	
# 提交变更，包括当前日期
git commit -m "当前文件最新时间是${current_date}_上传"
	
# 推送到远程仓库的 befe 分支
git push origin befe


# 保留窗口，不自动关闭
echo "推送完成。按回车键退出..."
read -r


