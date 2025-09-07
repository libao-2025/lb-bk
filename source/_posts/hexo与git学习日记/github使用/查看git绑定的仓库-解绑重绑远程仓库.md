---
title: 查看git绑定的仓库-解绑重绑远程仓库
categories:
  - hexo与git学习日记
  - github使用
tags:
  - GitHub
  - git仓库
date: 2024-10-18 18:40:45
---

# 查看git绑定的仓库-解绑重绑远程仓库



解决 GitHub S``` 连接问题


1.  初始化本地仓库（如果还没有初始化）：

```
git init
```

2.  将远程仓库添加为远程分支（使用你提供的仓库名）：

```
git remote add origin git@github.com:lifuaini2019/publii-bk.git
```

3.  拉取远程仓库的 `befe` 分支到本地：

```
git fetch origingit checkout befe
```

4.  添加本地文件到暂存区：

```
git add .
```

5.  提交更改：

```
git commit -m "Initial commit"
```

6.  推送本地更改到远程 `befe` 分支：

```
git pu``` origin befe
```

这些命令会执行你需要的所有步骤：初始化本地仓库，绑定到远程仓库，检出远程分支，添加和提交本地文件，最后将更改推送到远程仓库的指定分支。

# 要查看本地文件夹与哪个远程仓库绑定

要查看本地文件夹与哪个远程仓库绑定，以及该远程仓库的别名，你可以使用以下 Git 命令：

```
git remote -v
```

这个命令会列出所有远程仓库及其别名，以及每个远程仓库的 URL。对于每个绑定的远程仓库，-v 选项（即 --verbose）会提供更多的信息，包括绑定时的 URL。

执行这个命令后，你会看到类似以下的内容（假设你的本地仓库已经与一个名为 origin 的远程仓库绑定了）：

```
origin  git@github.com:username/repo.git (fetch)
origin  git@github.com:username/repo.git (push)

```

在这个输出中：

* `origin` 是远程仓库的别名。
* `git@github.com:username/repo.git` 是远程仓库的 URL。
* `(fetch)` 和 `(pu```)` 表示你可以从这个远程仓库拉取和推送内容。

这样你就可以清楚地看到本地仓库与哪个远程仓库绑定了。



# 解绑远程仓库

用什么命令给解绑。再绑到新的仓库，并克隆指定的分支到这个文件夹里？


1.  解绑远程仓库：

```
git remote remove origin
```

这条命令会移除名为 `origin` 的远程仓库。如果你为远程仓库设置了多个别名，你需要为每个别名重复这个操作。

2.  将本地仓库绑定到新的远程仓库。假设新的远程仓库 URL 是 `git@github.com:lifuaini2019/publii-bk.git`，你可以使用以下命令：

```
git remote add origin git@github.com:lifuaini2019/publii-bk.git
```

3.  克隆指定的分支到本地文件夹。如果你想要克隆特定的分支，例如 `befe` 分支，你可以使用以下命令：

```
git clone -b befe git@github.com:lifuaini2019/publii-bk.git
```

这样就会在当前目录下多了一个publii-bk的文件夹
可以用这命令快速打开当前文件夹

```
start .
```

这里 `-b befe` 选项指定了克隆时要使用的分支。

如果你已经有一个本地仓库，并且想要将远程仓库克隆到这个现有文件夹中，你需要先解绑现有的远程仓库，然后再使用 `git clone` 命令。以下是完整的步骤：


.  绑定到新的远程仓库：

```
git remote add origin git@github.com:lifuaini2019/publii-bk.git
```

3.  克隆指定的分支到本地文件夹：

```
git clone -b befe origin
```

如果本地文件夹已经有内容，你需要先清空或备份该文件夹，然后执行克隆操作，因为 `git clone` 会覆盖本地文件夹的内容。如果你想要保留本地文件夹的内容，你可以克隆到一个新的文件夹中：

```
git clone -b befe origin /path/to/new/directory
```

确保将 `/path/to/new/directory` 替换为你希望克隆到的目标文件夹路径。


G:\\我的文档\\Publii\\backups\\fei-ke-piao-ji 要把上面的文件夹绑定到git@github.com:lifuaini2019/publii-bk.git 分支befe




要将位于 `G:\我的文档\Publii\backups\fei-ke-piao-ji` 的文件夹绑定到 `git@github.com:lifuaini2019/publii-bk.git` 仓库，并克隆指定的分支 `befe`，请按照以下步骤操作：

1.  首先，确保你的 Git 工具和命令行环境已经配置好。

2.  打开命令提示符或终端窗口。

3.  使用 `cd` 命令切换到 `G:\我的文档\Publii\backups\fei-ke-piao-ji` 文件夹：

```
cd G:\我的文档\Publii\backups\fei-ke-piao-ji
```

4.  初始化一个新的 Git 仓库（如果这个文件夹还不是 Git 仓库的话）：

```
git init
```

5.  添加远程仓库（假设这个仓库还没有绑定任何远程仓库）：

```
git remote add origin git@github.com:lifuaini2019/publii-bk.git
```

6.  拉取远程仓库的 `befe` 分支到本地：

```
git fetch origin
```

7.  切换 `befe` 分支：

```
git checkout befe
```

如果你想要将 `befe` 分支克隆到这个文件夹中，而不是从现有的本地仓库拉取分支，你应该先克隆仓库，然后再切换到 `befe` 分支。以下是执行这个操作的命令：

```
git clone -b befe git@github.com:lifuaini2019/publii-bk.git
```

这个命令会在当前目录下创建一个名为 `publii-bk` 的文件夹，并从中克隆 `befe` 分支的内容。

请确保在执行上述命令之前，你已经在正确的目录中，并且你有权访问 `git@github.com:lifuaini2019/publii-bk.git` 仓库。如果你之前已经在这个文件夹中初始化了 Git 仓库，并且想要更新到 `befe` 分支，那么步骤 4 和 5 是必要的。如果你只是想克隆一个分支到这个文件夹中，那么步骤 6 和 7 就足够了。



## 我不想创建publii-bk文件夹，我只想把publii-bk文件夹下的内容拉到G:\\我的文档\\Publii\\backups\\fei-ke-piao-ji


如果你只想将 `publii-bk` 仓库的内容拉取到 `G:\我的文档\Publii\backups\fei-ke-piao-ji` 文件夹中，而不创建新的 `publii-bk` 文件夹，你需要执行以下步骤：

1.  首先，打开命令提示符或终端窗口。

2.  使用 `cd` 命令切换到 `G:\我的文档\Publii\backups\fei-ke-piao-ji` 文件夹：

```
cd G:\我的文档\Publii\backups\fei-ke-piao-ji
```

3.  初始化一个新的 Git 仓库（如果这个文件夹还不是 Git 仓库的话）：

```
git init
```

4.  添加远程仓库：

```
git remote add origin git@github.com:lifuaini2019/publii-bk.git
```

5.  拉取远程仓库的 `befe` 分支到本地：

```
git fetch origin befe
```

6.  检出 `befe` 分支到当前文件夹：

```
git checkout befe
```

或者，如果你想直接拉取内容而不创建分支，可以这样做：

```
git pull origin befe
```

这条命令会拉取远程仓库 `origin` 的 `befe` 分支，并将内容合并到当前分支上。如果当前文件夹已经是 Git 仓库，`git pull` 会自动将远程分支合并到本地当前分支。

执行这些命令后，`G:\我的文档\Publii\backups\fei-ke-piao-ji` 文件夹中的内容将被更新为远程仓库 `publii-bk` 中 `befe` 分支的内容。

如果我本地文件更新，我只选择两种文件类型推送到仓库，例如\*.```文件和\*.tar只更新推送这两种文件到远程仓库，用什么命令



如果你只想更新和推送特定类型的文件（例如 `.```` 和 `.tar`）到远程仓库，你可以使用 `git add` 命令配合 `find` 或 `grep` 命令来选择这些文件，然后执行 `git pu```` 来更新远程仓库。

以下是一个基本的例子，说明如何操作：

1.  首先，切换到包含你想要更新的文件的目录：

```
cd /path/to/your/local/directory
```

2.  使用 `find` 命令来找到所有的 `.```` 和 `.tar` 文件，并使用 `git add` 命令来添加它们到暂存区：

```
find . -name "*.```" -exec git add {} \; && find . -name "*.tar" -exec git add {} \;
```

这条命令会找到当前目录及其子目录下所有的 `.```` 和 `.tar` 文件，并将它们添加到 Git 的暂存区。

3.  接下来，使用 `git commit` 命令来提交更改：

```
git commit -m "Update .``` and .tar files"
```

4.  最后，使用 `git pu```` 命令来将更改推送到远程仓库：

```
git pu``` origin <branch-name>
```

将 `<branch-name>` 替换为你想要推送到远程仓库的分支名称。

如果你使用的是 Unix-like 系统（如 Linux 或 macOS），上面的命令链可以简化为：

```
find . \( -name "*.```" -o -name "*.tar" \) -exec git add {} \; && git commit -m "Update .``` and .tar files" && git pu``` origin <branch-name>
```

如果你使用的是 Windows 系统，可能需要使用批处理或 Power```ell 来执行类似操作，因为 `find` 命令在 Windows 中不是内置的。

请注意，使用 `find` 和 `git add` 可能会将所有匹配的文件（包括隐藏文件）添加到暂存区。如果你只想添加特定的文件，你可能需要修改 `find` 命令来更精确地指定路径或文件名。

如果我要推送到befe 的分支，又是怎样写

如果你只想推送特定类型的文件（例如 `.```` 和 `.tar`）到远程仓库的 `befe` 分支，你需要按照以下步骤操作：

1.  切换到包含你想要更新的文件的本地目录：

```
cd /path/to/your/local/directory
```

2.  使用 `find` 命令来找到所有的 `.```` 和 `.tar` 文件，并使用 `git add` 命令来添加它们到暂存区：

```
find . \( -name "*.```" -o -name "*.tar" \) -exec git add {} \;
```

这条命令会找到当前目录及其子目录下所有的 `.```` 和 `.tar` 文件，并将它们添加到 Git 的暂存区。

3.  提交更改到 `befe` 分支：

```
git commit -m "Update .``` and .tar files"
```

4.  推送更改到远程仓库的 `befe` 分支：

```
git pu``` origin befe
```

这里，`origin` 是你配置的远程仓库的别名，而 `befe` 是你想要推送到远程仓库的目标分支。

如果你执行以上命令，Git 会将本地 `befe` 分支上的更改（只包含 `.```` 和 `.tar` 文件）推送到远程仓库中的 `befe` 分支。

确保在执行这些命令之前，你已经切换到了正确的分支，并且本地分支 `befe` 已经与远程分支同步。如果需要，你可以使用以下命令来确保本地分支与远程分支同步：

```
git fetch origingit checkout befegit merge origin/befe
```

这样，在执行推送命令之前，你的本地 `befe` 分支将是最新且与远程 `befe` 分支同步的。

