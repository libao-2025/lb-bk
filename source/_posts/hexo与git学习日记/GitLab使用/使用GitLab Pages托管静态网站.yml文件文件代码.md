---
layout: aaa
title: 使用GitLab Pages托管静态网站.yml文件文件代码
date: 2024-09-25 09:56:19
categories: 
- GitLab使用
tags:
- git命令
---




# 使用GitLab Pages托管静态网站.yml文件文件代码

本文介绍了如何使用GitLab Pages免费托管静态网站，包括GitLab Pages的概念、支持的静态站点生成器以及详细的使用步骤，如开通账号、创建仓库、配置.gitlab-ci.yml文件和访问项目。



#### 文章目录

* [前言](#_5)
* [一、GitLab Pages是什么？](#GitLab_Pages_11)
* [二、使用步骤](#_24)
* * [1.开通账号，创建Git仓库同步项目](#1Git_25)
    * [2.添加.gitlab-ci.yml文件，开启GitLab Pages](#2gitlabciymlGitLab_Pages_31)
    * [3.部署成功之后访问项目](#3_52)
* [总结](#_58)

* * *

## 前言

在我们日常的程序员养成过程中，会产生一些产物，自己做的一些小网站，小页面之类，一般都是在本地调试访问，一旦我们想让其他朋友也可以随时访问，就需要单独在[公有云](https://so.csdn.net/so/search?q=%E5%85%AC%E6%9C%89%E4%BA%91&spm=1001.2101.3001.7020)上买一个服务器去部署，一是需要付费，二是我们调试页面访问量不多，单独搞个服务器部署有点浪费。这样看来，使用Git网站的Pages服务进行静态网页托管就是一个不错的选择。

* * *

## 一、[GitLab](https://so.csdn.net/so/search?q=GitLab&spm=1001.2101.3001.7020) Pages是什么？

使用 GitLab Pages，可以直接从 GitLab 的存储库中发布静态网站。

* 用于任何个人或商业网站。
* 使用任何静态站点生成器 (SSG) 或纯 HTML。
* 为您的项目、组或用户帐户创建网站。
* 在您自己的 GitLab 实例或 GitLab.com 上免费托管您的网站。
* 连接您的自定义域和 TLS 证书。
* 将任何许可归于您的内容。
* Pages 支持的 SSG 示例

要使用 Pages 发布网站，您可以使用任何静态网站生成器，例如 Gatsby、Jekyll、Hugo、Middleman、Harp、Hexo 或 Brunch。您还可以发布任何直接用纯 HTML、CSS 和 JavaScript 编写的网站。  
Pages 不支持动态服务器端处理，例如，根据.php需要.asp。与动态网站相比，了解更多关于 静态网站的信息。

## 二、使用步骤

### 1.开通账号，创建Git仓库同步项目

首先注册一个GitLab账号，登录首页之后新建项目，项目标识串可以命名为：\[注册账户名\].gitlab.io，这样后续就可以直接通过这个地址访问到项目了。  
![在这里插入图片描述](https://bktu-2f513f.gitlab.io/g-lab-tu/fd2ed3d9c028f92f83354c039c3aa195.png)  
接下来使用打开刚刚创建好的项目，拿到仓库的地址，在电脑本地使用Git将项目Clone本地，这里是使用的Visual Studio Code中的的Git克隆功能，需要先配置好你的Git环境和账号，之后在本地进行项目的修改和提交。  
![在这里插入图片描述](https://bktu-2f513f.gitlab.io/g-lab-tu/f1da5d8c2495d7fa40d02987cfbf0d07.png)

### 2.添加.gitlab-ci.yml文件，开启GitLab Pages

启用之前需要在项目中添加.gitlab-ci.yml文件，来配置项目的所在位置目录，在项目设置的CI/CD中编辑器下添加对应脚本代码，根据项目类型不同，添加的脚本也不同，主要是设置编译方式和输出目录，可以点击浏览模板查找对应示例。  
![在这里插入图片描述](https://bktu-2f513f.gitlab.io/g-lab-tu/6ceadf3599fa28e3513d718d5becabf1.png)  
纯html项目的脚本示例：

```
pages:
  stage: deploy
  script:
    - mkdir .public
    - cp -r ./* .public
    - rm -rf public
    - mv .public public
  artifacts:
    paths:
      - public
  rules:
    - if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
```

### 3.部署成功之后访问项目

在添加.gitlab-ci.yml文件之后，GitLab识别之后会依据脚本自动执行，在每次更新项目时都会重新执行脚本，在流水线下可以查看详细部署情况，部署成功之后，就可以通过我们设置的项目路径：\[注册账户名\].gitlab.io来进行访问了。

* * *

### master 分支下的文件也包含在部署中
了将 master 分支下的文件也包含在部署中，你需要在 rules 部分修改条件判断，使其在 master 分支的提交时执行部署脚本。以下是如何修改你的GitLab CI/CD配置文件的示例：

```
pages:
  stage: deploy
  script:
    - mkdir .public
    - cp -r ./* .public
    - rm -rf public
    - mv .public public
  artifacts:
    paths:
      - public
  rules:
    - if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH || $CI_COMMIT_BRANCH == 'master'

```
在这个修改后的配置中，rules 部分包含两个条件：

$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH：这保持原来的逻辑，即默认分支（通常为 master 或 main，取决于你的项目设置）的提交将触发部署。
$CI_COMMIT_BRANCH == 'master'：这个新条件确保当分支名为 master 时，也会执行部署脚本。
这样，无论默认分支是什么，或者你提交的是 master 分支的更改，部署流程都会被执行。

请确保你的 CI_DEFAULT_BRANCH 变量设置正确，这样配置才能按预期工作。如果你不设置 CI_DEFAULT_BRANCH，那么通常情况下 CI_COMMIT_BRANCH == 'master' 就足够了。

注意：如果你的项目默认分支不是 master 而是其他名称（如 main），请相应地调整上述配置中的条件。

## 总结

以上就是使用GitLab Pages托管静态网站的全部内容了，本文仅仅简单介绍了GitLab Pages的使用，对于在过程中使用到的Git相关的操作没有做过多讲解，不了解Git使用方法的同学可以查找Git使用相关教程进行学习。

 