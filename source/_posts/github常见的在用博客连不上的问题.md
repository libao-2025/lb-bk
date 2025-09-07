---
layout: post
title: github常见的在用博客连不上的问题
date: 2025-09-07 10:56:40
tags:
---

# github常见的在用博客连不上的问题

---

## 经常出现如下错误提示的
`
INFO  Copying files from extend dirs...
fatal: detected dubious ownership in repository at 'H:/bk/c51学习博客/.deploy_git'
'H:/bk/c51学习博客/.deploy_git' is owned by:
        'S-1-5-21-3296363495-2372482831-1974833738-500'
but the current user is:
        'S-1-5-21-167963868-313762946-2422772350-1001'
To add an exception for this directory, call:

        git config --global --add safe.directory 'H:/bk/c51学习博客/.deploy_git'
FATAL Something's wrong. Maybe you can find the solution here: https://hexo.io/docs/troubleshooting.html
Error: Spawn failed
    at ChildProcess.<anonymous> (H:\bk\c51学习博客\node_modules\hexo-deployer-git\node_modules\hexo-util\lib\spawn.js:51:21)
    at ChildProcess.emit (node:events:514:28)
    at cp.emit (H:\bk\c51学习博客\node_modules\cross-spawn\lib\enoent.js:34:29)
    at ChildProcess._handle.onexit (node:internal/child_process:294:12)
`

---

## 解决方案是添加信任
```
git config --global --add safe.directory 'H:/bk/c51学习博客'
```

---

## 如出现这样的提示：
`
INFO  Copying files from extend dirs...
fatal: detected dubious ownership in repository at 'H:/bk/c51学习博客/.deploy_git'
'H:/bk/c51学习博客/.deploy_git' is owned by:
        'S-1-5-21-3296363495-2372482831-1974833738-500'
but the current user is:
        'S-1-5-21-167963868-313762946-2422772350-1001'
To add an exception for this directory, call:

        git config --global --add safe.directory 'H:/bk/c51学习博客/.deploy_git'
FATAL Something's wrong. Maybe you can find the solution here: https://hexo.io/docs/troubleshooting.html
`
## 其实都是一样的方法
---

## 解决方案是添加信任 ：添加两条信任即可解决
```
git config --global --add safe.directory 'H:/bk/c51学习博客'
git config --global --add safe.directory 'H:/bk/c51学习博客/.deploy_git'
```
