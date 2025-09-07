---
title: 一键hexo部署并备份源到分支
categories:
  - hexo与git学习日记
  - github使用
date: 2024-09-16 10:00:00
---
   
hexo博客每次写了新的文章，要部署到博客上
都要重复操作 
<!--more-->
hexo c
hexo g
hexo d，
这三条命令！！

过于麻烦，于是写个巨简陋的脚本，减少点

工作量，这里可以创一个一键部署并备份到分支的脚，运行一个代码即可完成几条重复的命令！

先在本地仓库所在的文件路径下打开 Git Bash 使用 nano 或 vim 编辑器来创建和编辑文件。这里我们使用 nano 作为示例：

```
$ nano lifu.sh

```

##填入下面内容：

```

#清除缓存文件 (db.json) 和已生成的静态文件 (public)。
hexo clean

# 命令用于生成静态文件，一般可以简写为 hexo g
hexo generate

#hexo server 命令用于启动本地服务器，一般可以简写为 hexo s

#hexo deploy 命令用于部署网站，一般可以简写为 hexo d

hexo deploy

#!/bin/bash     下面为备份到仓库
# 获取当前日期，格式为 YYYYMMDD
current_date=$(date +%Y%m%d)
	
# 添加所有变更到暂存区
git add .
	
# 提交变更，包括当前日期
git commit -m "updated${current_date}_xk"
	
# 推送到远程仓库的 befe 分支
git push origin befe

```

##步骤3：保存并退出编辑器
按下 Ctrl+O 保存文件
按下 Enter 确认文件名
按下 Ctrl+X 退出编辑器

运行脚本
现在，每当你完成一系列更改并准备提交时，只需在终端运行：

```
./lifu.sh
```

执行后自动部署新博文！将自动被添加、提交，并推送到远程仓库，一切操作一气呵成！

大家可以根据自己的需求修改变更记录内容。希望这个脚本能帮助你提升工作效率！

全自动执行完成！看到这里，你认为爽吗？？呵呵

