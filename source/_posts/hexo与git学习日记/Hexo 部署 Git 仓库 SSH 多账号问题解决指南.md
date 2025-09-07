---
title: Hexo 部署 Git 仓库 SSH 多账号问题解决指南
categories:
  - hexo与git学习日记
tags:
  - GPT学习
  - GitHub
  - git命令
  - hexo博客
date: 2025-08-27 20:20:26
---

# Hexo 部署 Git 仓库 SSH 多账号问题解决指南

在使用 Hexo 部署博客时，如果本机有多个 GitHub 或 GitLab 账号，可能会遇到如下错误：

```
Please make sure you have the correct access rights
and the repository exists.
FATAL Something's wrong. Maybe you can find the solution here: https://hexo.io/docs/troubleshooting.html
Error: Spawn failed
```

本文将详细说明排查思路与解决方案。

---

## 1️⃣ 问题现象

1. 默认 SSH 账号能连接 GitHub：

```bash
ssh -T git@github.com
# 输出：
# Hi lifuaini2019! You've successfully authenticated, but GitHub does not provide shell access.
```

2. 自定义 SSH 账号无法连接：

```bash
ssh -T git@lb.github.com
# 输出：
# ssh: connect to host github.com port 22: Connection timed out
```

---

## 2️⃣ 问题分析

- 默认账户连接正常，说明 Git 与 SSH 本身没问题。
- 自定义账号连接超时，说明 SSH 配置里 **走的是 22 端口**，但网络被屏蔽。
- Hexo deploy 依赖 `hexo-deployer-git` 调用 Git，如果 SSH 连接失败，就会报 `Spawn failed`。

---

## 3️⃣ 多账户 SSH 配置示例

在 `~/.ssh/config` 中配置多个账号：

```ssh
# GitHub 账户 one
Host lb.github.com
    HostName ssh.github.com  # 注意这里改成 ssh.github.com
    Port 443                 # 避免 22 端口被屏蔽
    User git
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa

# GitHub 账户 two
Host zy.github.com
    HostName ssh.github.com
    Port 443
    User git
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_zy

# GitLab 账户
Host gitlab.com
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/id_rsa_lab6435

# 远程设备 wky101
Host wky101
    HostName 192.168.3.101
    User root
    IdentityFile ~/.ssh/id_rsa_wky101
```

> ⚠ 注意：
> - 每个 `Host` 都可以是任意别名，比如 `lb.github.com`、`zy.github.com`。
> - SSH key 文件路径正确且可用。
> - 对于国内网络，GitHub 默认 22 端口可能被屏蔽，改用 `ssh.github.com:443`。

---

## 4️⃣ 测试 SSH 连接

```bash
ssh -T git@lb.github.com
ssh -T git@zy.github.com
ssh -T git@gitlab.com
```

输出类似：

```
Hi lifuaini2019! You've successfully authenticated, but GitHub does not provide shell access.
```

说明 SSH 配置正确。

---

## 5️⃣ Hexo `_config.yml` deploy 配置示例

如果使用 SSH，部署配置如下：

```yml
deploy:
  type: git
  repository: git@lb.github.com:用户名/仓库名.git
  branch: main
```

> 如果你想使用第二个账号：
>
> ```yml
> deploy:
>   type: git
>   repository: git@zy.github.com:用户名/仓库名.git
>   branch: main
> ```

---

## 6️⃣ 部署步骤

```bash
hexo clean      # 清理缓存
hexo g          # 生成静态文件
hexo d          # 部署到远程仓库
```

- 如果一切配置正确，就可以顺利部署。
- SSH 端口、密钥、remote URL 都是关键。

---

## 7️⃣ 总结

1. 多账号 SSH 需要在 `~/.ssh/config` 中分别配置别名。
2. 国内网络可能屏蔽 22 端口，建议用 `ssh.github.com:443`。
3. Hexo deploy 的 repository URL 对应 SSH 别名。
4. 每次部署前可用 `ssh -T` 测试连接，确保密钥有效。

这样，你的 Hexo 部署就能安全、稳定地支持多个账号。

---

**小提示**：以后如果新增 GitHub 账号，只需在 `~/.ssh/config` 添加一段对应配置，然后在 Hexo 配置里改 URL 即可。