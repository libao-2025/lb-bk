---
title: 初始化本地 Git 仓库-并绑定到远程仓库
categories:
  - hexo与git学习日记
  - github使用
tags:
  - GPT学习
  - GitHub
sticky: 97
date: 2024-12-16 15:09:36
---

# 初始化本地 Git 仓库-并绑定到远程仓库

好的，我会详细解释从 `git init` 到将本地仓库推送到远程仓库的每一步过程。假设你已经在 GitHub 上创建了一个远程仓库，并且本地计算机已经配置好了 SSH 密钥。

### 1. 初始化本地 Git 仓库

首先，在本地项目文件夹中初始化 Git 仓库：

```
git init
```

- `git init` 命令会在当前目录下创建一个新的 Git 仓库。它会生成一个 `.git` 文件夹，表示这是一个 Git 管理的目录。

### 2. 连接远程仓库

接下来，你需要将本地仓库与远程 GitHub 仓库关联。假设远程仓库的 URL 是 `git@github.com:...***`，你可以使用以下命令来添加远程仓库：

```
git remote add origin git@github.com:.**
```

- `git remote add origin` 命令将远程仓库 URL 与本地仓库关联，`origin` 是远程仓库的默认名称，你也可以使用其他名称，但 `origin` 是常见的约定。

### 设置远程仓库命令-以下为你一键命令生成脚本

请输入您的 GitHub 仓库链接，然后点击“生成命令”按钮，接着点击“复制命令”按钮：

<!-- 输入框 -->
<label for="repo-url">GitHub 仓库链接:</label>
<input type="text" id="repo-url" placeholder="例如: https://github.com/yourusername/your-repository.git" size="50">
<br><br>

<!-- 生成命令按钮 -->
<button onclick="generateCommand()">生成命令</button>

<!-- 显示生成的命令 -->

<p>生成的命令:</p>
<textarea id="generated-command" rows="2" cols="100" readonly></textarea>

<br>

<!-- 复制命令按钮 -->
<button onclick="copyToClipboard()">复制命令</button>

<script>
  // 生成命令
  function generateCommand() {
    var repoUrl = document.getElementById("repo-url").value.trim();
    if (repoUrl) {
      var command = "git remote add origin " + repoUrl;
      document.getElementById("generated-command").value = command;
    } else {
      alert("请先输入有效的 GitHub 仓库链接！");
    }
  }
  // 复制命令到剪贴板
  function copyToClipboard() {
    var copyText = document.getElementById("generated-command");
    copyText.select();
    copyText.setSelectionRange(0, 99999); // For mobile devices
    document.execCommand("copy");
    alert("命令已复制到剪贴板！");
  }
</script>

#### 1-1说明例如
* 如果你原来的链接是git remote add origin git@gitlab.com:l2837/anan.git
* 在本地多个帐号绑git的，那么如果这个帐号本地为gg.gitlab.com那么就要改成下面这个
* git remote add origin git@gg.gitlab.com:l2837/anan.git


### 2.1给这个仓库设置局部的用户名和邮箱：
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

### 3. 下载远程仓库的所有分支

你可以使用 `git fetch` 命令来获取远程仓库的所有分支，但不自动合并它们到本地：

```
git fetch --all
```

- `git fetch --all` 命令会从所有配置的远程仓库获取最新的分支和更新。

### 4. 查看远程分支

要查看远程仓库的所有分支，可以使用以下命令：

```
git branch -r
```

- `git branch -r` 会列出所有远程分支，格式通常是 `origin/branch-name`。

### 5. 切换到 `main` 分支

通常情况下，GitHub 的默认分支是 `main`，你可以切换到本地的 `main` 分支：

```
git checkout main
```

- `git checkout main` 会切换到本地的 `main` 分支。如果本地还没有 `main` 分支，它会自动创建一个并切换过去。

如果本地没有 `main` 分支，你可以使用以下命令来创建并切换到 `main` 分支：

```
git checkout -b main origin/main
```

- `git checkout -b main origin/main` 会从远程的 `origin/main` 分支创建一个新的本地 `main` 分支并切换过去。

### 6. 推送本地分支到远程仓库

现在你已经切换到 `main` 分支，可以将本地的 `main` 分支推送到远程仓库：

```
git push -u origin main
```

- `git push -u origin main` 会将本地的 `main` 分支推送到远程仓库的 `main` 分支。`-u` 参数会将本地分支与远程分支关联，以后可以直接使用 `git push` 和 `git pull`。

### 7. 后续操作

#### 1. 修改#文件后，使用 `git add .` 添加更改

在你修改了本地项目中的文件后，需要将这些修改添加到 Git 的暂存区。你可以使用以下命令：

```
git add .
```

- `git add .` 会将当前目录下的所有修改过的文件（包括新增、修改和删除的文件）添加到暂存区。`git add .` 会递归地将所有子目录中的文件也加入暂存区。

如果你只想添加某个特定文件，可以使用文件名替代 `.`，例如：

```
git add filename.txt
```

#### 2. 提交更改

在将文件添加到暂存区后，下一步是将这些更改提交到本地 Git 仓库。你可以使用 `git commit` 命令，并为提交添加描述信息：

```
git commit -m "描述你的更改可以随便写"
```

- `git commit -m "描述你的更改"` 会将暂存区的更改提交到本地仓库，并附上一个描述信息，帮助你和其他人理解这次提交的内容。

#### 3. 推送更改到远程仓库

一旦你完成了本地提交，接下来就可以将更改推送到远程仓库。使用以下命令将本地的 `main` 分支推送到远程仓库：

```
git push
```

- `git push` 会将本地分支的最新提交推送到远程仓库。如果你之前已经使用 `git push -u origin main` 关联了本地分支和远程分支，后续的 `git push` 会默认推送到远程的 `main` 分支。

如果你是第一次推送到远程仓库，或者没有设置默认推送分支，你可以使用以下命令：

```
git push origin main
```

- `git push origin main` 会将本地的 `main` 分支推送到远程仓库的 `main` 分支。

#### 4. 后续操作的总结

1. **修改文件后**，使用 `git add .` 将所有更改添加到暂存区。
2. **提交更改**，使用 `git commit -m "描述你的更改"` 提交更改。
3. **推送更改**，使用 `git push` 将本地提交推送到远程仓库。


### 总结

1. 初始化本地仓库：`git init`

2. 添加远程仓库：`git remote add origin git@github.com:yourusername/your-repository.git`

3. 获取远程分支：`git fetch --all`

4. 查看远程分支：`git branch -r`

5. 切换到 `main` 分支：`git checkout main` 或 `git checkout -b main origin/main`

6. 推送到远程仓库：`git push -u origin main`

7. 查看绑定的仓库：git remote -v
8. 经常遇到这个问题：
解决方法
1. 添加信任目录
Git 提示你可以执行以下命令，手动信任该目录：
```
git config --global --add safe.directory 'H:/bk/gitlab节点输入法文件仓库'

```





   