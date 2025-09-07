---
title: Hexo博客域名有两种方法
categories:
  - hexo与git学习日记
  - hexo博客与主题
tags:
  - Hexo
  - 博客
date: 2024-09-22 20:41:47
---


#Hexo博客域名有两种方法

##第一种，直接部署在git库，直在博客source目录下创建一个文件名为CNAME的，在里面填上你的域名
例如我的:
```
zy.lifu.eu.org
```

登陆github网站,没中文可以用翻译。
找到Settings（设置）进入pages（页面）选择

Build and deployment(构建和部署)
下面选择你部署的网页在哪个分支，一般是main

再到你的域名里添加一条	
CNAME    
指向到你的
```
XXXXXX.github.io

```

XXXXXX换成你自已的github的用户名

第二种就是直接从git接取网站代码部署到cloudflare的Workers 和 Pages

新建Pages,然后绑定git拉取，很简单，然后在你的应用里自定义域，添加你的域名就可以
这用这方法国内好用一点点，访问速度要比直接部署在git要快！！

