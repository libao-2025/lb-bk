---
title: 多个git帐号在同一个电脑上设置ssh配置
categories:
  - hexo与git学习日记
  - github使用
tags:
  - GPT学习
  - GitHub
  - git
  - git仓库
  - git命令
date: 2024-11-14 18:35:25
---

# 多个git帐号在同一个电脑上设置ssh配置

GPT回答: 

在同一台电脑上配置两个 GitLab 帐号使用 SSH，可以通过设置不同的 SSH key 和 SSH 配置文件来实现。以下是详细步骤：

### 1. 生成不同的 SSH Key 
假设你已经有一个 GitLab 帐号的 SSH key，并且命名为 `id_rsa_gitlab1`。现在我们需要为第二个 GitLab 帐号生成新的 SSH key。

```
# 生成新的 SSH key
ssh-keygen -t rsa -C "your_email@example.com" -f ~/.ssh/id_rsa_gitlab2
```

在这条命令中：
 
- `-C` 参数后填入你的邮箱，可以是第二个 GitLab 帐号的邮箱。
 
- `-f` 参数指定了保存密钥文件的路径，这里我们保存为 `~/.ssh/id_rsa_gitlab2`。
按提示完成生成后，将生成 `id_rsa_gitlab2` 和 `id_rsa_gitlab2.pub` 两个文件。
### 2. 将公钥添加到 GitLab 帐号 
分别登录到两个 GitLab 帐号，将对应的公钥文件 `.pub` 内容添加到 GitLab 账户的 SSH key 设置中。

```
# 查看公钥内容
cat ~/.ssh/id_rsa_gitlab1.pub  # 第一个账号的公钥
cat ~/.ssh/id_rsa_gitlab2.pub  # 第二个账号的公钥
```

在每个 GitLab 帐号的 “SSH Key” 设置页面粘贴对应的公钥内容。

### 3. 配置 SSH Config 文件 
打开 SSH 配置文件 `~/.ssh/config`，如果没有此文件，可以创建一个：

```
touch ~/.ssh/config
```

编辑文件并添加以下配置：


```
# 配置第一个 GitLab 帐号
Host gitlab-1
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/id_rsa_gitlab1

# 配置第二个 GitLab 帐号
Host gitlab-2
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/id_rsa_gitlab2
```

在这个配置中：
 
- `Host gitlab-1` 和 `Host gitlab-2` 是自定义的主机名，用于区分两个 GitLab 帐号。
 
- `HostName gitlab.com` 是 GitLab 的主机地址。
 
- `User git` 指定了用户名称（通常为 `git`）。
 
- `IdentityFile` 指定了对应的私钥文件路径。

### 4. 克隆或推送代码时使用不同的配置 
现在，在克隆仓库或推送代码时，可以使用自定义的主机名（即 `gitlab-1` 或 `gitlab-2`）来区分不同的帐号。
#### 克隆示例 
假设第一个账号的仓库地址为 `git@gitlab.com:username1/repo.git`，第二个账号的仓库地址为 `git@gitlab.com:username2/repo.git`，你可以将链接改为如下格式：

```
# 使用第一个 GitLab 帐号
git clone gitlab-1:username1/repo.git

# 使用第二个 GitLab 帐号
git clone gitlab-2:username2/repo.git
```

#### 推送示例 
当你已经在本地有两个不同账号的项目时，可以在 `.git/config` 文件中修改 `url` 来匹配自定义的主机名。

```
[remote "origin"]
    url = git@gitlab-1:username1/repo.git  # 使用第一个账号
    fetch = +refs/heads/*:refs/remotes/origin/*
```

### 5. 测试 SSH 连接 

可以通过以下命令测试两个 GitLab 帐号的连接是否成功：


```
ssh -T gitlab-1
ssh -T gitlab-2
```
如果配置正确，会显示类似 `Welcome to GitLab, @username` 的信息。
这样配置后，两个 GitLab 帐号就可以在同一台电脑上同时使用 SSH 来访问各自的仓库。

我问
```
我原来配置github是用这个方法# one(lb@gmail.com)
Host lb.github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa
User lb
# two(zy@ gmail.com)
Host zy.github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_zy
User zy   能不能参照这样？
```
GPT回答: 

是的，您可以完全按照这种方法为两个 GitLab 帐号配置 SSH。按照 GitHub 的配置格式，GitLab 的配置可以如下设置：
假设您已有两个不同的 SSH key：`~/.ssh/id_rsa_gitlab1` 和 `~/.ssh/id_rsa_gitlab2`，以下是配置文件的示例：
### 1. 配置 GitLab 的 SSH Config 文件 
打开或创建 `~/.ssh/config` 文件，添加以下内容：

```
# 第一GitLab账号 (first@example.com)
Host gitlab1.com
    HostName gitlab.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_gitlab1
    User git

# 第二GitLab账号 (second@example.com)
Host gitlab2.com
    HostName gitlab.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_gitlab2
    User git
```

在这里：
 
- `Host gitlab1.com` 和 `Host gitlab2.com` 是自定义主机名，可以任意设置，用于区分两个 GitLab 帐号。
 
- `HostName gitlab.com` 指向 GitLab 的域名。
 
- `PreferredAuthentications publickey` 设置了使用公钥认证。
 
- `IdentityFile` 为每个帐号指定不同的 SSH key。
 
- `User git` 是 GitLab 默认的用户。

### 2. 使用配置克隆或推送代码 
在克隆或推送时，可以使用配置中指定的主机名 `gitlab1.com` 或 `gitlab2.com` 访问不同的 GitLab 帐号。
例如：


```
# 使用第一个 GitLab 帐号克隆
git clone git@gitlab1.com:username1/repo.git

# 使用第二个 GitLab 帐号克隆
git clone git@gitlab2.com:username2/repo.git
```

### 3. 修改现有仓库的 Remote URL 
如果您已经在本地有仓库，可以编辑 `.git/config` 文件，将 `url` 修改为您自定义的主机名。

```
[remote "origin"]
    url = git@gitlab1.com:username1/repo.git  # 对应第一个账号
    fetch = +refs/heads/*:refs/remotes/origin/*
```

### 4. 测试连接 

测试两个 GitLab 帐号的连接：


```
ssh -T git@gitlab1.com
ssh -T git@gitlab2.com
```
若配置正确，应显示类似 `Welcome to GitLab, @username` 的欢迎信息。
这样配置后，您就可以和 GitHub 的配置一样，方便地在同一台电脑上管理多个 GitLab 帐号了。

我问
```
我可以拉取下载回来，想推送上去出现这样
admin@DESKTOP-DABFHG1 MINGW64 /d/gitlab仓库/anan (main)
$ git commit -m "当前文件最新时间是${current_date}_上传"
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'admin@DESKTOP-DABFHG1.(none)')

admin@DESKTOP-DABFHG1 MINGW64 /d/gitlab仓库/anan (main)
$ git push origin befe
error: src refspec befe does not match any
error: failed to push some refs to 'gg.gitlab.com:l2837/anan.git'

admin@DESKTOP-DABFHG1 MINGW64 /d/gitlab仓库/anan (main)
$
```

GPT回答: 

出现这个错误主要有两个原因：一是 Git 还未配置用户名和邮箱，二是分支名称或推送的远程地址有误。下面是详细的解决方法：

### 1. 设置 Git 用户名和邮箱 

Git 需要知道提交者的身份，可以在本地配置全局或仅针对当前仓库设置用户名和邮箱。根据错误信息提示，您可以选择以下两种方式之一：

#### 全局配置（适用于所有仓库） 


```
git config --global user.name "Your Name"          # 替换为您的名字
git config --global user.email "your_email@example.com"  # 替换为您的邮箱
```

#### 当前仓库配置（仅在当前仓库生效） 


```
git config user.name "Your Name"                    # 替换为您的名字
git config user.email "your_email@example.com"      # 替换为您的邮箱
```

> **注意** ：请将 `Your Name` 和 `your_email@example.com` 替换为您的 GitLab 用户名和关联的邮箱。
### 2. 确认分支名称和远程仓库地址 

看错误信息，您输入的命令为：


```
git push origin befe
```
这条命令尝试将 `befe` 分支推送到远程仓库，但似乎没有叫 `befe` 的本地分支。您可以按以下步骤检查和修改推送分支：
#### 检查当前分支名称 
确认您当前所在的分支，例如是 `main`，而不是 `befe`：

```
git branch
```
如果您确认当前分支是 `main`，可以改用以下命令推送：

```
git push origin main
```

#### 确认远程仓库地址 

确保您的远程仓库地址配置正确，可以通过以下命令查看远程仓库的配置：


```
git remote -v
```

若地址不正确，可以使用以下命令修改远程仓库地址：


```
git remote set-url origin git@gitlab1.com:l2837/anan.git  # 替换为您的远程仓库地址
```

### 3. 完整操作流程示例 

以下是完成这几步的完整操作示例：


```
# 1. 配置用户名和邮箱
git config user.name "Your Name"
git config user.email "your_email@example.com"

# 2. 检查当前分支
git branch  # 确认您所在分支是 main

# 3. 提交修改（如果未提交）
git add .
git commit -m "当前文件最新时间是$(date +%Y-%m-%d)_上传"

# 4. 推送到远程仓库的 main 分支
git push origin main
```

这样处理后，应该可以成功提交并推送到远程仓库了。如果还有问题，请检查远程仓库地址和当前分支是否正确。

我问

这个文本我设成这样没错吧

```
# one(lb@gmail.com)
Host lb.github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa
User lb

# two(zy@ gmail.com)
Host zy.github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_zy
User zy

# gitlab帐号
Host lab6435.gitlab.com
HostName gitlab.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_lab6435
User lab6435
  
# gitlab谷歌帐号

Host gg.gitlab.com
HostName gitlab.com  
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa_gg
User gg
```

GPT回答: 

您的 SSH 配置基本是正确的，但有几点需要确认和改进。`User` 字段应该始终是 `git`，而不是 GitLab 或 GitHub 帐号的用户名。`User` 字段在 SSH 配置中仅用于 SSH 连接，不会影响身份认证。GitLab 和 GitHub 使用的 `User` 应该始终是 `git`。
以下是调整后的配置：


```ssh
# GitHub 帐号 one
Host lb.github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa
    User git  # 统一改成 git

# GitHub 帐号 two
Host zy.github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_zy
    User git  # 统一改成 git

# GitLab 帐号 lab6435
Host lab6435.gitlab.com
    HostName gitlab.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_lab6435
    User git  # 统一改成 git
  
# GitLab 谷歌帐号 gg
Host gg.gitlab.com
    HostName gitlab.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_gg
    User git  # 统一改成 git
```

### 使用方法 

在使用这些配置克隆、拉取或推送代码时，可以参考以下示例：
 
- 使用 `lb.github.com` 克隆 GitHub 仓库：

```
git clone git@lb.github.com:username/repo.git
```
 
- 使用 `gg.gitlab.com` 克隆 GitLab 仓库：

```
git clone git@gg.gitlab.com:username/repo.git
```

如果配置正确，这样的配置可以在同一台电脑上方便地管理多个 GitHub 和 GitLab 帐号。
上面是我一个新手设置的问题！！大家可以参考