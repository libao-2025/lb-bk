---
title: 安装zerotier的过程-飞牛os系统
categories:
  - 软路由专栏
tags:
  - 飞牛OS
  - 软路由
date: 2024-10-29 17:13:31
---

# 飞牛OS 安装配置 ZeroTier 教程（含常见错误解决）

ZeroTier 是一个开源虚拟局域网（VPN）工具，可以让不同网络下的设备像在同一局域网中互联。特点是无需公网 IP，无需复杂路由配置，适合远程办公、NAS 互联、家庭内网穿透等。本文基于飞牛OS（Debian 衍生）系统整理。

## 准备工作
- 系统环境：飞牛OS（可通过 `uname -r` 查看内核版本，如 `6.12.18-trim`）
- 权限要求：root
- 工具要求：curl（系统默认自带）

## 安装 ZeroTier

1. 更新系统包
```bash
sudo apt update && sudo apt upgrade -y
```
2. 执行官方安装脚本
```bash
curl -s https://install.zerotier.com | sudo bash
```
3. 启动 ZeroTier 并设置开机自启
```bash
sudo systemctl start zerotier-one
sudo systemctl enable zerotier-one
sudo systemctl status zerotier-one
```
如果看到 `Active: active (running)` 表示启动成功。

## 加入 ZeroTier 网络

1. 在官网创建网络：打开 [ZeroTier 官网](https://my.zerotier.com)，注册账号并创建网络，记下 Network ID。
2. 在飞牛OS 加入网络
```bash
sudo zerotier-cli join <你的网络ID>
```
示例：
```bash
sudo zerotier-cli join 115ea290854bf04a
```
3. 授权设备：登录 ZeroTier 管理后台，在 Members 中找到新设备，勾选 Authorized，可设置设备名称或固定 IP。
4. 查看状态
```bash
sudo zerotier-cli info
```
输出类似：
```
200 info <设备ID> 1.14.0 ONLINE
```

## 常见错误及解决方法

1. curl 未安装
```
curl: command not found
```
解决：
```bash
sudo apt install curl -y
```

2. zerotier-cli 未找到
```
zerotier-cli: command not found
```
解决：
```bash
curl -s https://install.zerotier.com | sudo bash
```

3. systemctl 未找到
```
systemctl: command not found
```
解决：
```bash
service zerotier-one start
service zerotier-one status
```

4. join 后显示 REQUESTING_CONFIGURATION
原因：设备未授权
解决：登录后台 Members 列表，勾选 Authorized

5. Ping 不通对方设备
排查：
- 对方未加入同一网络 → `zerotier-cli listnetworks`
- 防火墙阻拦 → 检查 iptables/ufw
- 没分配 IP → 在管理后台手动分配 IP

## 清理与维护

- 卸载 Debian 官方 headers（防止与飞牛OS定制内核冲突）：
```bash
sudo apt remove --purge linux-headers-amd64 linux-headers-6.1.0-* -y
```
- 查看飞牛OS内核头文件：
```bash
apt search linux-headers-6.12
```
- 安装对应内核 headers（若有）：
```bash
sudo apt install linux-headers-6.12.18-trim -y
```
- 清理无用包：
```bash
sudo apt autoremove -y
sudo apt clean
```

## 连接测试
在同一 ZeroTier 网络的其他设备上：
```bash
ping <ZeroTier 虚拟 IP>
```
若有响应表示连接成功。

## 总结
- 飞牛OS 使用 ZeroTier 非常方便，可实现异地设备互联
- 核心步骤：安装 ZeroTier → 加入网络 → 授权 → 测试
- 常见问题可参考第五部分解决

**作者**：整理自官方文档与飞牛OS实测  
**日期**：2025-08-28

