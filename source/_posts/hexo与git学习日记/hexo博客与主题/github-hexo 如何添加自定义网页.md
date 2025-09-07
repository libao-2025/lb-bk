---
title: github-hexo 如何添加自定义网页
categories:
  - hexo与git学习日记
  - hexo博客与主题
tags:
  - Hexo
  - 博客
date: 2024-09-22 20:41:47
---

# github-hexo 如何添加自定义网页


### Hexo自定义原理

Hexo 系列的博客中的文章都是经Hexo的主题渲染的静态网页。所以Hexo博客大部分都呈现出一种高度的统一化与规范化。不过 Hexo 提供了**跳过渲染**功能，使得我们可以直接在博客中放入自定义网页。

比如在博客中放入图片、自定义404.html、自定义About页面、简历等

#### 创建自定义网页

网页可以是自己编写的，也可以是别人现成的源码（下载喜欢的页面）。

网页编写完成后，在Hexo\\source目录下创建一个文件夹（文件夹名称任意，比如我创建的是about这个文件夹，部署完成后，访问[https://24.lifu.us.kg/about/即可看到效果，依此类推）](https://24.lifu.us.kg/about/)

将 html 文件放置于此文件夹，并重命名为 index.html 。

#### [](#%E8%B7%B3%E8%BF%87%E6%B8%B2%E6%9F%93)跳过渲染

跳过渲染有下述两种方法：

1.  在html文件中添加跳过渲染指令

> 用编辑器打开放入\\Hexo\\source\\创建的文件夹中的 index.html 文件，在开头添加如下代码即可

```
---
layout: false
---
```

添加该指令后，执行 hexo g命令时便会跳过该 index.html文件，使得index.html不受当前 hexo 主题影响，完全是一个独立的网页，如果网页引用了 css 或 js，css 和 js 需使用外链或者将css js 文件放入index.html同目录下引用。

引用图片亦是如此

2.  在_config.yml文件中设置skip_render

使用编辑器打开 Hexo 目录下的_config.yml文件，找到skip_render

skip_render一般有以下四种常用参数：

```
跳过source目录下的 test.html: skip_render: test.html

跳过source目录下 test 文件夹内所有文件：skip_render: test/*

跳过source目录下 test 文件夹内所有文件包括子文件夹以及子文件夹内的文件：skip_render: test/**
```

跳过多个路径：

```
skip_render:
 - test.html
 - test/*
```

添加完成后便不会渲染指定文件/文件夹。

3.  完成

执行hexo g -d 发布，就可以在自己的网页上看到自定义页面了（可以制作一份自己的简历哦）。

