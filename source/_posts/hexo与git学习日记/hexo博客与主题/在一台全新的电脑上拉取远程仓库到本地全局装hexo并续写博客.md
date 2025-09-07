---
title: 在一台全新的电脑上拉取远程仓库到本地全局装hexo并续写博客
categories:
  - hexo与git学习日记
  - hexo博客与主题
tags:
  - hexo
  - hexo博客
  - git
date: 2024-10-12 13:06:57
---

# 在一台全新的电脑上拉取远程仓库到本地全局装hexo并续写博客

## 首先hexo要装的软件有：
1.Windows：[下载并安装 git](https://git-scm.com/download/win)
2.安装 Node.js     [官方的 安装程序](https://nodejs.org/zh-cn/download/)

## 全局安装 Hexo(可以任意路径下安装)
上面两个应用程序安装完成后，即可使用 npm 安装 Hexo。
```
npm install -g hexo-cli
```
---
如果这时候你没有旧的博客续写，你用下面方式即可新建一个！

```
#这是初始化一个仓库文件夹名为wdbk
hexo init wdbk 
#进入文件夹
cd wdbk
#安装依赖
npm install
#这个直接生成并在本地网页4000端口即可打开
hexo server
```

## 这次只要写的是续写旧博客
* 首先拉取原来备份在github仓库的文件到本地
* 生成 key
* 添加私钥到github网站上
* 克隆仓库到本地
这里说的是一个帐号在一个电脑上的操作，[如果要两个帐号可以参考这一文章](2024/09/25/hexo与git学习日记/github使用/两个git帐号在本地电脑设置密码)

## github仓库设置
例如我的github帐号是` lifuaini2019@gmail.com`
* 在电脑的C:\Users\Administrator\.ssh文件夹下打开git软件执行下面代码
```
ssh-keygen -t rsa -C lifuaini2019@gmail.com
```
一路确认即可完成
* 打开当前目录下的C:\Users\Administrator\.ssh\id_rsa.pub文件

复制里面的代码到

![屏幕截图 2024-10-12 141200](https://app.fekepj.com/list-tu/2024/10/12/0f71105a6a46cd267f3bf5c5713e9cfb.png)

![屏幕截图 2024-10-12 141250](https://app.fekepj.com/list-tu/2024/10/12/c714431e476fb4332607a3e7227917ab.png)

![屏幕截图 2024-10-12 141316](https://app.fekepj.com/list-tu/2024/10/12/bab816dc6831b9ec6ce177c1aeff27b0.png)

![屏幕截图 2024-10-12 141407](https://app.fekepj.com/list-tu/2024/10/12/7c3e242dc2154758aaee64d729d9b531.png)

![屏幕截图 2024-10-12 141455](https://app.fekepj.com/list-tu/2024/10/12/2a0271c544e7653272027b0820c9e960.png)

## clone远程仓库到本地
例如我的是
```
git clone git@github.com:lifuaini2019/2024bk.git
```
上面是克隆默认分支
如果 要指定分支的可以用下面方法
```
git clone -b befe git@github.com:lifuaini2019/2024bk.git
```
上面这个方法是克隆befe分支到本地

或者你用第一个方法克隆后，再用下面切换分支应该也是可以的
```
git checkout befe
```

## 下载到本地后进入文件夹例如我的：2024bk
* 在文件夹内执行安装hexo依赖
```
npm install
```
安装好依赖后文件夹内会出现多一个文件夹名叫：node_modules
这时候你就可以在本地执行hexo博客了！！

如果想省事，可以一键更新并备份推送到远程befe分支
在博客根目录新那家一个:XXX.sh文件
打开这个文件粘贴下面这代码到里面
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
git commit -m "当前文件最新时间是${current_date}_上传"
	
# 推送到远程仓库的 befe 分支
git push origin befe

```
## 重要提示，在2025年发现在新电脑有一个这样的问是

最终执行了这四句，在新电脑才能正常续hexo 博客
*1
```
git config --global --add safe.directory 'G:/我的文档/所有博客/李保个人博客/.deploy_git'
```
*2
```
git config --global --add safe.directory 'G:/我的文档/所有博客/李保个人博客'
```
*3
```
git config --global user.email "lifuaini2019@gmail.com"
```
*4
```
git config --global user.name "lifuaini2019"
```
*5遇到不能备份到befe分支时用以下命令
```
git pull origin befe
```
用完这个命令再执行推送即可！
以后写完博客双击即可自动执行上面这几行代码~~~~
有错我再修改！结束