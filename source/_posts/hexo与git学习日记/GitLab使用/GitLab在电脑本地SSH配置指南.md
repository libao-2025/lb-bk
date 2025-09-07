---
title: GitLab在电脑本地SSH配置指南
categories:
  - hexo与git学习日记
  - GitLab使用
tags:
  - hexo
  - hexo博客
date: 2024-09-25 14:49:54
---


# GitLab在电脑本地SSH配置指南

## 我问GPT:

我想和你聊聊有关使用gitlab的问题，我有帐号了，也有仓库了，例如这是我的仓库地址git@gitlab.com:libao21/lck.git  
首先第一步我要怎要在本地电脑创建一个密码与仓库配对，以后在本地操作推送文件

## ChatGPT答: 

要在本地电脑上配置 GitLab 仓库的推送权限，建议使用 SSH 密钥对（而不是密码），这样可以安全地管理与仓库的连接。以下是具体步骤：
1. **生成 SSH 密钥对** 
在本地电脑上打开命令行或终端，执行以下命令来生成 SSH 密钥：
C:\Users\Administrator\.ssh来到这个目录下执行git打命令
用git软件
首先输入下面
``` 
ssh-keygen -t rsa -b 4096 -C "XXXXXXXX@qq.com"
```
其中 `"XXXXXXXX@qq.com"` 需要替换为你的 GitLab 注册邮箱。然后会提示你选择存储密钥的位置，直接按回车键使用默认路径。接着可以选择是否设置密码保护密钥（可以为空，但建议设置一个）。2. **添加 SSH 密钥到 SSH Agent** 确保 `ssh-agent` 正在运行，并添加你的 SSH 私钥到 Agent：
* 注意
* 如果你电脑上有github和gitlab其它帐号已配对的ssh就要定义密钥名字，例如我开第一步出现时我输入id_rsa_lab6435
* 然后一直下一步，完成后一般会在C:\Users\Administrator\.ssh这个目录下生成两个名为
id_rsa_lab6435
id_rsa_lab6435.pub
![输入图片说明](https://bktu-2f513f.gitlab.io/imgs/2024-09-25/4Jl6Ou0lGa96E8S2.png)
继续执行下面代码
``` 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_lab6435
```
3. **如果要将 SSH 公钥添加到 GitLab** 找到生成的公钥文件，默认位于 `~/.ssh/id_rsa_lab6435.pub`。你可以用以下命令查看公钥内容：

``` 
cat ~/.ssh/id_rsa_lab6435.pub
```

复制公钥内容。

然后登录到 GitLab，按照以下步骤将公钥添加到你的 GitLab 帐户：
 
- 点击右上角头像，选择 **Preferences** 。
 
- 在左侧菜单中选择 **SSH Keys** 。
 
- 将复制的公钥粘贴到文本框中，设置一个有效期限或保持为空，并点击 **Add key** 。
4. **测试 SSH 连接** 
执行以下命令，测试是否成功与 GitLab 通过 SSH 建立连接：


``` 
ssh -T git@gitlab.com
```

成功的话，你会看到类似如下的提示信息：


```
Welcome to GitLab, @your_username!
```
5. **克隆仓库或推送代码** 
现在你可以在本地克隆仓库或推送代码。克隆仓库命令如下：

以下是克隆主分支到本地
``` 
git clone git@gitlab.com:libao21/lck.git
```
也可以指定分支：例
```
git clone -b main git@gitlab.com:libao21/bktu.git
```
或者
```
git clone -b befe git@gitlab.com:libao21/bktu.git
```

顺便加上切换分支的命令
```
git checkout befe
```
或都
```
git checkout main
```

在你完成修改并推送代码时，直接使用以下命令即可：
部署上传更新与github一

``` 
git add .
git commit -m "上传这可以随便写"
git push origin main
```

这样，你就可以在本地推送文件到 GitLab 仓库了。
当你完成上面，第一次可能成功连到仓库！
但关闭了git命令软件下次打开又要重新打一轮这步骤


下面是我的经验：

如果你电脑有其它帐号
要在C:\Users\Administrator\.ssh目录新建一个文件config或者在已有的文件config加入以下内容：
```
# gitlab帐号
Host gitlab.com
  HostName gitlab.com
  User git
  IdentityFile ~/.ssh/id_rsa_lab6435
```
如果已有，就加入即可，没有就新建！以后再要绑定其它帐号也是同样方法！
好啦！

