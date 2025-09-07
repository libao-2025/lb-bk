---
title: 修复github-22端口不通的方法-hosts文件修改
categories:
  - GPT问答类
tags:
  - git
  - git仓库
  - git命令
date: 2024-12-16 14:46:04
---

# 修复github-22端口不通的方法-hosts文件修改
. SSH连接问题
错误信息 ssh: connect to host github.com port 22: Connection refused 表明当前无法通过SSH连接到GitHub。这可能是由于网络环境或SSH配置的问题。

解决方法：
检查网络是否限制了端口22
 检查本地问题
(1) 测试端口 22 是否可用
使用以下命令检查本地是否能连接到 GitHub 的端口 22：
```
ssh -T git@github.com
```
如果出现如下的图片就是正常链接到github的

![](https://s2.loli.net/2024/12/16/pSRMZHBxJVqiecl.png)
---
如果出现下面这种情况就是链接失败的

![](https://s2.loli.net/2024/12/16/RfB2SN9kOaWnvZz.png)

最后我发现在打开了加整github的加速软件「Watt Toolkit」导致的。后来我修改下面文件
hosts文件修改方法可以参以下：：
在使用 Windows 系统时，我遇到了一个无法保存修改 `hosts` 文件的情况。每次尝试保存时，都会弹出提示框，显示文件无法保存，且文件可能被保护。经过多次尝试和排查，我最终找到了一个有效的解决方案，下面是我解决这个问题的详细过程：

### 问题描述

每次修改 `hosts` 文件后，尝试保存时，Notepad++ 会弹出以下错误提示：

```
vbnet复制代码Save failed
The file cannot be saved and it may be protected.
Do you want to launch Notepad++ in Administrator mode?
```

尽管我已经以管理员身份运行 Notepad++，但依然无法保存文件。

### 排查步骤

1. **检查文件权限**：
   - 首先，我右键点击 `hosts` 文件，选择 **属性**，进入 **安全** 选项卡，确保我的账户有 **完全控制** 权限。
   - 尽管权限设置正确，但问题依旧存在。
2. **检查文件是否被其他程序占用**：
   - 我尝试关闭了所有可能会占用 `hosts` 文件的程序，如防火墙、杀毒软件等。
   - 但问题依然没有解决。
3. **尝试使用其他编辑器**：
   - 我尝试使用 Windows 自带的 **记事本** 以管理员身份打开 `hosts` 文件进行修改，但同样无法保存文件。
4. **查看 Windows 文件保护机制**：
   - 由于 `hosts` 文件是系统文件，Windows 可能会启用文件保护机制，防止修改。
   - 但是禁用文件保护并不是一个推荐的解决方案，因为它可能会影响系统的安全性。

### 解决方案

经过多次尝试后，我发现以下步骤有效地解决了问题：

1. **重启电脑**：
   - 首先，我重启了电脑，确保没有程序在后台占用 `hosts` 文件。
2. **修改 `hosts` 文件**：
   - 重启后，我重新打开 Notepad++，以管理员身份编辑 `hosts` 文件。
   - 这一次，我能够成功修改文件并保存。
3. **再次重启电脑**：
   - 为确保修改生效，我再次重启了电脑。
   - 重启后，我发现 `hosts` 文件的修改已经生效，问题完全解决。

### 结论

通过重启电脑并再次尝试修改 `hosts` 文件，我成功解决了无法保存文件的问题。这个过程表明，可能是某些程序占用了文件或系统缓存导致文件无法保存。重启后，系统会释放这些资源，使得文件可以正常编辑和保存。

### 经验总结

- **管理员权限**：在修改系统文件时，确保使用管理员权限打开编辑器。
- **重启电脑**：如果遇到无法保存文件的情况，重启电脑是一个有效的解决方法，能够清理系统缓存和释放文件锁定。
- **文件保护机制**：某些系统文件可能会受到 Windows 文件保护机制的限制，修改时需要特别注意。

希望这个解决方案能帮助到遇到类似问题的朋友，避免重复的排查和无效尝试。

------

你可以将这个过程作为博客文章记录，方便以后参考。如果有其他问题，也可以随时更新这篇文章。







##### 您说：

要写明，用什么命令测试是否22端口被禁用。然后确是22端口，再修改这个文件内容，要把内容写上来作为演示



###### ChatGPT 说：

ChatGPT

好的，下面是更新后的博客记录，包含了如何使用命令检查是否 22 端口被禁用，并详细描述了如何修改 `hosts` 文件的内容。

------

## 修复 `hosts` 文件无法保存问题的详细过程

在使用 Windows 系统时，我遇到了一个无法保存修改 `hosts` 文件的情况。每次尝试保存时，都会弹出提示框，显示文件无法保存，且文件可能被保护。经过多次尝试和排查，我最终找到了一个有效的解决方案，下面是我解决这个问题的详细过程：

### 问题描述

每次修改 `hosts` 文件后，尝试保存时，Notepad++ 会弹出以下错误提示：

```
vbnet复制代码Save failed
The file cannot be saved and it may be protected.
Do you want to launch Notepad++ in Administrator mode?
```

尽管我已经以管理员身份运行 Notepad++，但依然无法保存文件。

### 排查步骤

1. **检查文件权限**：

   - 首先，我右键点击 `hosts` 文件，选择 **属性**，进入 **安全** 选项卡，确保我的账户有 **完全控制** 权限。
   - 尽管权限设置正确，但问题依旧存在。

2. **检查文件是否被其他程序占用**：

   - 我尝试关闭了所有可能会占用 `hosts` 文件的程序，如防火墙、杀毒软件等。
   - 但问题依然没有解决。

3. **尝试使用其他编辑器**：

   - 我尝试使用 Windows 自带的 **记事本** 以管理员身份打开 `hosts` 文件进行修改，但同样无法保存文件。

4. **查看 Windows 文件保护机制**：

   - 由于 `hosts` 文件是系统文件，Windows 可能会启用文件保护机制，防止修改。
   - 但是禁用文件保护并不是一个推荐的解决方案，因为它可能会影响系统的安全性。

5. **检查端口是否被禁用**：

   - 在排查过程中，我发现可能与网络端口的访问权限有关。为了测试是否是端口问题，我使用以下命令检查 22 端口是否被禁用：

   ```
   bash
   
   
   复制代码
   netstat -an | find "22"
   ```

   - 如果 22 端口被禁用，输出结果会显示类似于以下内容：

   ```
   less
   
   
   复制代码
   TCP    [::]:22                   [::]:0                 LISTENING
   ```

   - 如果没有显示任何结果，表示 22 端口被禁用了。

### 解决方案

经过多次尝试后，我发现以下步骤有效地解决了问题：

1. **重启电脑**：

   - 首先，我重启了电脑，确保没有程序在后台占用 `hosts` 文件。

2. **修改 `hosts` 文件**：

   - 重启后，我重新打开 Notepad++，以管理员身份编辑 `hosts` 文件。
   - 这一次，我能够成功修改文件并保存。以下是我修改后的 `hosts` 文件内容：
   - 以下是原内容的其中一部份：
```
# Steam++ Start
127.0.0.1 steamcdn-a.akamaihd.net
127.0.0.1 steamuserimages-a.akamaihd.net
127.0.0.1 cdn.akamai.steamstatic.com
127.0.0.1 community.akamai.steamstatic.com
127.0.0.1 avatars.akamai.steamstatic.com
127.0.0.1 store.akamai.steamstatic.com
127.0.0.1 community.steamstatic.com
127.0.0.1 media.steampowered.com
127.0.0.1 steamcommunity.com
127.0.0.1 www.steamcommunity.com
127.0.0.1 store.steampowered.com
127.0.0.1 api.steampowered.com
127.0.0.1 help.steampowered.com
127.0.0.1 login.steampowered.com
127.0.0.1 checkout.steampowered.com
127.0.0.1 img.youtube.com
127.0.0.1 shared.st.dl.eccdnx.com
127.0.0.1 clan.st.dl.eccdnx.com
127.0.0.1 store.st.dl.eccdnx.com
127.0.0.1 avatars.st.dl.eccdnx.com
127.0.0.1 media.st.dl.eccdnx.com
127.0.0.1 video.st.dl.eccdnx.com
127.0.0.1 huggingface.co
127.0.0.1 github.dev
127.0.0.1 api.github.com
127.0.0.1 gist.github.com
127.0.0.1 github.githubassets.com
127.0.0.1 support-assets.githubassets.com
127.0.0.1 education.github.com
127.0.0.1 raw.github.com
127.0.0.1 githubusercontent.com
127.0.0.1 raw.githubusercontent.com
127.0.0.1 camo.githubusercontent.com
127.0.0.1 cloud.githubusercontent.com
127.0.0.1 avatars.githubusercontent.com
127.0.0.1 avatars0.githubusercontent.com
127.0.0.1 avatars1.githubusercontent.com
127.0.0.1 avatars2.githubusercontent.com
127.0.0.1 avatars3.githubusercontent.com
127.0.0.1 user-images.githubusercontent.com
127.0.0.1 objects.githubusercontent.com
127.0.0.1 private-user-images.githubusercontent.com
127.0.0.1 github.com
127.0.0.1 pages.github.com
127.0.0.1 githubapp.com
127.0.0.1 hub.docker.com
# Steam++ End
```
把上面的肉容改成如下，也就是注释了一部份：
```
# Steam++ Start
127.0.0.1 steamcdn-a.akamaihd.net
127.0.0.1 steamuserimages-a.akamaihd.net
127.0.0.1 cdn.akamai.steamstatic.com
127.0.0.1 community.akamai.steamstatic.com
127.0.0.1 avatars.akamai.steamstatic.com
127.0.0.1 store.akamai.steamstatic.com
127.0.0.1 community.steamstatic.com
127.0.0.1 media.steampowered.com
127.0.0.1 steamcommunity.com
127.0.0.1 www.steamcommunity.com
127.0.0.1 store.steampowered.com
127.0.0.1 api.steampowered.com
127.0.0.1 help.steampowered.com
127.0.0.1 login.steampowered.com
127.0.0.1 checkout.steampowered.com
127.0.0.1 img.youtube.com
127.0.0.1 shared.st.dl.eccdnx.com
127.0.0.1 clan.st.dl.eccdnx.com
127.0.0.1 store.st.dl.eccdnx.com
127.0.0.1 avatars.st.dl.eccdnx.com
127.0.0.1 media.st.dl.eccdnx.com
127.0.0.1 video.st.dl.eccdnx.com
127.0.0.1 huggingface.co
# Removed GitHub entries
# 127.0.0.1 github.dev
# 127.0.0.1 api.github.com
# 127.0.0.1 gist.github.com
# 127.0.0.1 github.githubassets.com
# 127.0.0.1 support-assets.githubassets.com
# 127.0.0.1 education.github.com
# 127.0.0.1 raw.github.com
# 127.0.0.1 githubusercontent.com
# 127.0.0.1 raw.githubusercontent.com
# 127.0.0.1 camo.githubusercontent.com
# 127.0.0.1 cloud.githubusercontent.com
# 127.0.0.1 avatars.githubusercontent.com
# 127.0.0.1 avatars0.githubusercontent.com
# 127.0.0.1 avatars1.githubusercontent.com
# 127.0.0.1 avatars2.githubusercontent.com
# 127.0.0.1 avatars3.githubusercontent.com
# 127.0.0.1 user-images.githubusercontent.com
# 127.0.0.1 objects.githubusercontent.com
# 127.0.0.1 private-user-images.githubusercontent.com
# 127.0.0.1 github.com
# 127.0.0.1 pages.github.com
# 127.0.0.1 githubapp.com
# 127.0.0.1 hub.docker.com
# Steam++ End

```

我发现怎样改也改不了！后来发现重启解决问题！其实重启是多余，真正是关了上面说到的github加速软件！！！完美解决！

3. **再次重启电脑**：

   - 为确保修改生效，我再次重启了电脑。
   - 重启后，我发现 `hosts` 文件的修改已经生效，问题完全解决。

### 结论

通过重启电脑并再次尝试修改 `hosts` 文件，我成功解决了无法保存文件的问题。这个过程表明，可能是某些程序占用了文件或系统缓存导致文件无法保存。重启后，系统会释放这些资源，使得文件可以正常编辑和保存。

### 经验总结

- **管理员权限**：在修改系统文件时，确保使用管理员权限打开编辑器。
- **重启电脑**：如果遇到无法保存文件的情况，重启电脑是一个有效的解决方法，能够清理系统缓存和释放文件锁定。
- **文件保护机制**：某些系统文件可能会受到 Windows 文件保护机制的限制，修改时需要特别注意。

希望这个解决方案能帮助到遇到类似问题的朋友，避免重复的排查和无效尝试。