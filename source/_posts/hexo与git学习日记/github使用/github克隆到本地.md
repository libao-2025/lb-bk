---
title: github克隆到本地2023前个人博客地址
categories:
  - hexo与git学习日记
  - github使用
date: 2023-09-23 10:00:00
---
更多信息: [我的个人博客2023](https://23.lifu.us.kg)

第1步：查看 或者 生成一个SSH-Key
```
ssh-keygen -t rsa -C xxx@xxx.com
```
 将 "xxx@xxx.com" 替换为你自己GitHub的邮箱地址
执行后一直回车即可


第五步：验证是否设置成功
```
ssh -T git@github.com
```

可以在网上创建仓库名例如叫：
2024bk
在本地用git命令执行：
```
git clone git@github.com:xxx/2024bk.git
```

xxx改成自已的名例如我的名是lifuaini2019

在本地用git命令执行：
```
git clone git@github.com:lifuaini2019/2024bk.git
```

就会克隆2024bk这仓库到本地


如果用
```
git clone -b befe https://github.com/lifuaini2019/2024bk.git
```
会克隆分支befe所有文件到本地
(我用这个路径来备份hexo博客源文件)

cd 2024bk 或到目录下执行git

上传文件:

添加所有文件到暂存区：
```
git add .

```
后面的.是代表所有文件，如果要指定的例如：
例如，如果你要添加一个名为 example.txt 的文件，你可以这样做：
```
echo "Hello, World!" > example.txt
```

使用 git add 命令将新文件添加到 Git 的暂存区：

```
git add example.txt
```
对暂存区中的更改进行提交，并添加一个提交信息：
```
git commit -m "上传文件说明随便写"
```
如果是全部文件直接执行上面的git add .即可
对添加到暂存区的文件进行提交，并添加一个提交信息：

```git commit -m "提交信息"```

将你的提交推送到远程仓库的 main 分支（或 master 分支）：
```
git push origin main

```
执行完以上步骤后，你将成功将本地仓库中的所有文件提交到远程仓库的 main 分支（或 master 分支）。
我的备份分支名叫befe
```
git push origin befe
```

如果没有分支可以操作创建分支
使用以下命令来创建并切换到名为 bepe 的新分支：
```
git checkout -b befe
```
我最后执行上面这一行代码即可结束部署！


下面为博客代码的三步执行即可更新
！
```
hexo c
```

```
hexo g
```

```
hexo d
```

这样你在部署好hexo博客代码后，再执行上面的备份，就会在befe分支下有着你铁博客源代码了！呵呵简单吧！~
