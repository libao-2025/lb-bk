---
title: 新电脑配SSH连接GitHub的完整教程
categories:
  - hexo与git学习日记
  - hexo博客与主题
date: 2025-08-25 01:01:24
tags:
---
# 新电脑配SSH连接GitHub的完整教程（自定义密钥名称）

## 1 检查本地是否已有 SSH 密钥

打开 **终端**，输入：
```
ls -al ~/.ssh
```
可以查找本地有没有密钥，
---图
如果你上面就是有！

- 如果没有密钥，可以生成新的。
- 如果已有密钥，决定是否继续使用已有密钥或生成新密钥。

---

## 2 生成新的 SSH 密钥

假设你的邮箱是 `lifuaini2019@gmail.com`，想把密钥命名为 `id_rsa`：

```
ssh-keygen -t ed25519 -C "lifuaini2019@gmail.com" -f ~/.ssh/id_rsa
```

说明：

- `-t ed25519`：使用 Ed25519 算法（安全、快速）
- `-C`：加标签，便于识别
- `-f`：指定密钥文件名，生成：

  - 私钥：`~/.ssh/id_rsa`
  - 公钥：`~/.ssh/id_rsa.pub`

**提示：**

- 系统会提示输入 passphrase（密码短语），可以设置，也可以留空直接回车。

---
如果当地有这些文件的不用生成
可以给这些文件加权限，可选

#### Step 1：修正 `.ssh/config` 文件权限
```
chmod 600 ~/.ssh/config
```
#### Step 2：修正 `.ssh` 目录权限
```
chmod 700 ~/.ssh
```
#### Step 3：检查私钥权限（通常是 id_rsa 或 id_ed25519）

```markdown
chmod 600 ~/.ssh/id_rsa

# 或者

chmod 600 ~/.ssh/id_ed25519
```

## 3 启动 ssh-agent 并添加密钥

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

确认密钥已加载：
```
ssh-add -l
```

---

## 4 将公钥添加到 GitHub

1.  复制公钥到剪贴板：

```
pbcopy < ~/.ssh/id_rsa.pub
```

2.  打开 GitHub → **Settings** → **SSH and GPG keys** → **New SSH key**
    中文对照`打开 GitHub，依次点击设置→SSH 和 GPG 密钥→新建 SSH 密钥`
3.  填写：

    - Title：随便写，比如 `Mac id_rsa`
    - Key：粘贴剪贴板内容

4.  点击 **Add SSH key**

---

## 5 配置 SSH 使用自定义密钥

如果密钥不是默认名，需要配置 Git 使用它：

1.  编辑 SSH 配置文件：
```
nano ~/.ssh/config
```
上面的命令就是在.ssh目录建一个config文件，也可以手动建

2.  添加以下内容：
如果本地只有一个帐户的可以下面这样写
```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa
```
如果有多帐户的可以这样写
```
# GitHub 账户 one
Host lb.github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa
    User lb

# GitHub 账户 two
Host zy.github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_zy
    User zy

```
3.  如果用命令窗口执行的下面操作保存并退出：

    - `Control + O` → 回车 → `Control + X`

---

## 6 测试 SSH 连接
如果本地单帐户的可以用下面命令
```
ssh -T git@github.com
```
---
如果多帐户的可以用下面
```
ssh -T git@lb.github.com
ssh -T git@zy.github.com
```
如果成功，会显示：

```
vbnetHi lifuaini2019! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## 7 初始化本地仓库（如果还没有）

进入你的项目文件夹：
```
cd ~/博客/李保个人
```


初始化 Git 仓库：
```
git init
```

添加文件并提交：

```
git add .
git commit -m "first commit"
```

---

## 8 添加远程仓库

如果远程仓库还没绑定：
单帐户的用
```
git remote add origin git@github.com:lifuaini2019/2024bk.git
```
本地多帐户的用
```
git remote add origin git@lb.github.com:lifuaini2019/2024bk.git
git remote add origin git@zy.github.com:lizuyu0910/zybk.git
```
如果提示：

```
arduinoerror: remote origin already exists.
```

说明已有 `origin`，可以修改 URL：

```
git remote set-url origin git@github.com:lifuaini2019/2024bk.git
```

---

## 9 推送到远程仓库

```
git push -u origin main
```

（如果你的分支是 `master`，则改为 `master`）

⚠️ 第一次推送可能会要求验证 SSH，确认即可。

---

## 10常用检查命令

- 查看远程仓库 URL：
```
git remote -v
```

- 查看已加载的 SSH 密钥：

- 测试 SSH 连接：

```
ssh -T git@github.com
```
或
```
ssh -T git@lb.github.com
```
---

### ✅ 总结

1.  生成 SSH 密钥并命名
2.  加载密钥到 ssh-agent
3.  添加公钥到 GitHub
4.  配置 `~/.ssh/config` 指定密钥
5.  初始化本地仓库 → 添加远程 → 推送

这样以后 **每台新电脑**都可以照着这份教程快速完成 GitHub SSH 设置。

---



### 注意事项

如出现下面这种情况:
`
libao2L@DESKTOP-1FFK9JT MINGW64 /h/bk/李保博客
$ git remote -v
fatal: detected dubious ownership in repository at 'H:/bk/李保博客'
'H:/bk/李保博客' is owned by:
        'S-1-5-21-3296363495-2372482831-1974833738-500'
but the current user is:
        'S-1-5-21-167963868-313762946-2422772350-1001'
To add an exception for this directory, call:
git config --global --add safe.directory 'H:/bk/李保博客'
`

这个错误信息表明 Git 检测到当前操作的仓库所有权存在可疑情况。具体解释如下：

错误原因：
所有权不匹配：Git 发现当前仓库 H:/bk/李保博客 的所有者与当前正在操作 Git 命令的用户不一致。
安全机制触发：为了防止潜在的安全风险，例如恶意脚本通过修改仓库来影响其他用户，Git 引入了这个安全检查机制。一旦检测到所有权不一致，就会报错并阻止相关操作。
相关信息：
仓库所有者：显示为 'S-1-5-21-3296363495-2372482831-1974833738-500'，这是一个安全标识符（SID），代表了拥有该仓库目录的用户或组。
当前用户：显示为 'S-1-5-21-167963868-313762946-2422772350-1001'，这是当前在命令行执行 Git 命令的用户的 SID。
解决方案：
添加安全目录例外：Git 提供了一种解决方法，即通过运行以下命令将该仓库目录添加到安全目录列表中：

```
git config --global --add safe.directory 'H:/bk/李保博客'
```
如果要把博客的推送目录一起加到安全目录中用下面这行

```
git config --global --add safe.directory 'H:/bk/李保博客/.deploy_git'
```

此操作的意义：执行上述命令后，Git 会将指定的仓库目录视为安全的，即使其所有者与当前用户不同，也不会再因所有权问题报错，从而允许你继续在该仓库中执行 Git 操作。不过，需要注意的是，添加此例外时应确保你信任该仓库的来源和内容，以免引入安全风险。

在 Windows 系统中，这种情况可能发生在不同用户账户下创建了仓库，或者当前用户的权限与仓库的初始权限设置不匹配等场景。