---
title: 两个git帐号在本地电脑设置密码
categories:
  - hexo与git学习日记
  - github使用
tags:
  - hexo博客
  - hexo
date: 2024-09-25 12:00:42
---


# 两个git帐号在本地电脑设置密码

## 一、生成两个[SSH](https://so.csdn.net/so/search?q=SSH&spm=1001.2101.3001.7020) key

为了举例方便，这里使用“one”和“two”两个账户。下同。
第一个帐号

```
ssh-keygen -t rsa -C lifuaini2019@gmail.com
```
第二个帐号
```
ssh-keygen -t rsa -C lizuyu0910@qq.com
```
也可以用一这样的命令后面直接

请把帐号改成自已的哦！！！

### 注意：

在第一个对话的时候输入重命名（id_rsa和id_rsa_zy），这样会生成两份SSH key，包含私钥和公钥共4个文件。
一般生成在这个路径下：C:\Users\Administrator\.ssh

## 二、添加私钥 github克隆到本地

第一步先输入

`id_rsa_zy`

# **创建config文件**

在`~/.ssh`目录执行命令下创建一个`config`文件

输入下面内容

```
#one([lb@gmail.com](mailto:lb@gmail.com))

Host [lb.github.com](http://lb.github.com/)
HostName [github.com](http://github.com/)
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa
User lb

#two(zy@ [gmail.com](http://gmail.com/))

Host [zy.github.com](http://zy.github.com/)
HostName [github.com](http://github.com/)
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_zy
User zy
```
首先给这个仓库设置局部的用户名和邮箱：
* 必须要在所属的仓库目录下执行
```
git config user.name "lb_name" ; git config user.email "lb_email"
```

第二个帐号：
* 必须要在所属的仓库目录下执行
```

git config user.name "zy_name" ; git config user.email "zy_email"
```
## 可以用下面命令测试是否边接正常
```
ssh -T lb.github.com
```
第二个帐号同样

```
ssh -T zy.github.com
```

![image-20241220192701214](https://s2.loli.net/2024/12/20/xw58WzaFviCYZug.png)

例如上图，绿色打叉显示的是失败的,红色打钩是正常的

六、使用

1、clone到本地

(1)原来一个帐号的写法：

```
git clone git@github.com:lifuaini2019/2024bk.git
```
上面写法默认克隆主main的分支到本的！

(2)现在的写法：
```
git clone git@lb.github.com:lifuaini2019/2024bk.git
```
上面默认克隆主main的分支到本的！
***

原来的克隆分支到本地的写法是:

```
git clone -b befe git@github.com:lifuaini2019/2024bk.git
```
现在的新写法是克隆分支befe

```
git clone -b befe git@lb.github.com:lifuaini2019/2024bk.git
```

---
## 第二个帐号同样这样改写
原来克隆主分支：main
```
git clone git@github.com:lizuyu0910/zybk.git
```
现克隆主分支是：main
```
git clone git@zy.github.com:lizuyu0910/zybk.git
```
原来克隆分支:befe
```
git clone -b befe git@github.com:lizuyu0910/zybk.git
```

现克隆分支：befe
```
git clone -b befe git@zy.github.com:lizuyu0910/zybk.git
```


### 如果你不在 `befe` 分支上，切换到该分支：

```
git checkout befe
```
切换主分支
```
git checkout main
```

再加一个，如果你是玩hexo博客的
如果你本地有两个 Hexo 博客，并且你想要修改其中一个博客的端口，你需要分别编辑两个博客项目的 `_config.yml` 配置文件。以下是具体步骤：

找到 其中一个`server` 部分，并将 `port` 的值更改为你想要的端口，例如 4001：

```
server:
  port: 4001
  host: localhost
```


Hexo在部署到Github后CNAME文件会消失或改变的解决方法
问题经过:
在转移网站后,在 Github网页上修改CNAME文件中指向的域名后,重新部署Hexo时发现CNAME指向的域名是之前的网站,而没有编程修改后的域名.排查后发现:

Hexo在Github上部署后,如果配置了一个自定义域名时,会自动在项目仓库根目录想新建一个CNAME文件,但是重新部署后CNAME会消失或者变成修改之前的状态,导致需要再次手动修改.

解决方法:
直接修改 hexo目录 下 source 文件夹内的CNAME文件的内容,用编辑器打开,第一行输入需要配置的域名.这样在部署的时候CNAME 文件会自动部署到Github.不用再次手动修改.
————————————————

如果你想要直接拉取远程仓库的最新更新并覆盖本地的文件，可以使用 `git pull --rebase` 命令。这个命令会获取最新的远程更改，并将它们应用到你的当前分支上，而不会合并历史记录。

以下是该命令的格式：

```
git pull --rebase origin befe
```

这里解释一下各个部分：

- `git pull` 是用来从远程仓库获取最新更改并合并到本地分支的命令。
- `-rebase` 选项告诉 Git 使用变基（rebase）而不是合并（merge）来应用更改。
- `origin` 是远程仓库的别名，通常对应于你克隆仓库时使用的远程仓库的名称。
- `bef` 是你想要拉取更新的分支名称。

请注意以下几点：

1. **变基**：`-rebase` 选项可能会改变提交的历史记录，这可能会影响依赖于这些提交的其他开发者的工作。在使用 `-rebase` 时，务必确保所有团队成员都已同步，以避免冲突。
2. **冲突处理**：如果发生冲突，你需要手动解决这些冲突，然后继续变基过程。
3. **安全性**：如果你对变基不熟悉，或者你的工作流程不支持变基，可能更倾向于使用 `git pull --merge`，它会合并远程更改而不是变基。

使用 `--rebase` 的命令如下：

```
git pull --rebase origin befe
```

这条命令将会：

- 获取远程仓库 `origin` 上 `bef` 分支的最新更改。
- 变基你的本地 `bef` 分支，将远程更改应用到本地分支的顶部。
- 如果出现冲突，将提示你解决冲突。解决冲突后，你可以使用以下命令继续：

```
git rebase --continue

```

重复这个过程，直到所有的冲突都得到解决，并且变基过程完成。



## 我的总结
我在两个电脑间经常做出 hexo 博客更新，源文件也就是原md文件我都是备分到befe分支里的
例如A和B电脑
如果我在A电脑做出更新后，回到B电脑
首先在博客根目录里先执拉取最新文件到本地
```
git pull --rebase origin befe
```
接取最新的分befe分支到本地合并，如果失败就执行：
```
git stash
```
执行一个上面这行
再执行上面第一行即可：
```
git pull --rebase origin befe
```
即可！