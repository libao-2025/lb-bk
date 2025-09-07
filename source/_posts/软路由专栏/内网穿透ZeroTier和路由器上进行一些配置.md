---
title: 内网穿透ZeroTier和路由器上进行一些配置
categories:
  - 软路由专栏
tags:
  - null
date: 2024-10-31 17:19:20
---

# 内网穿透ZeroTier和路由器上进行一些配置



使用ZeroTier进行内网穿透并访问内网设备，需要在ZeroTier和路由器上进行一些配置：

### 1. 配置ZeroTier网络

- 登录 ZeroTier控制台 并创建或选择一个已有的网络。
- 进入网络设置页面，在 `Advanced` 选项中启用 `Allow Global IP` 和 `Allow Managed IPs` 以允许全局和托管IP的访问。
- 在 `IP Assignment` 中为你的ZeroTier网络分配一个IP段（如 `192.168.191.0/24`），用于ZeroTier节点的内部通讯。
- 将路由器和需要访问的内网设备都加入到该ZeroTier网络，并记录各设备分配到的ZeroTier IP地址。

### 2. 在路由器上启用ZeroTier

确保路由器支持ZeroTier（如某些OpenWrt或自带ZeroTier插件的路由器），并按以下步骤操作：

- 在路由器中安装并启动ZeroTier，加入ZeroTier网络，确认路由器获得了ZeroTier分配的IP地址。
- 路由器内设置路由表，将内网网段路由到ZeroTier网络。具体操作为：
  - 设置ZeroTier网络的转发路由。比如，若内网IP段为 `192.168.1.0/24`，则将 `192.168.1.0/24` 路由到ZeroTier IP段。
  - 在ZeroTier的网络设置中，找到 `Route Settings` 选项，添加 `192.168.1.0/24 via <路由器的ZeroTier IP>`。
- 保存并应用配置。

### 3. 配置内网访问权限

- 确保路由器和内网设备允许ZeroTier IP段的访问，关闭防火墙限制。
- 测试从其他ZeroTier设备访问路由器的内网设备（使用设备的内网IP），验证连接是否成功。

完成以上设置后，ZeroTier节点就可以通过ZeroTier网络访问路由器及其内网的设备了。

上面就是整个流程

---

下面就是我的操作记录截图下次可能用到

---





![屏幕截图 2024-10-24 113127](https://app.fekepj.com/list-tu/2024/10/31/90a4434d3096a5a63d59efcc93705405.png)

![屏幕截图 2024-10-24 123904](https://app.fekepj.com/list-tu/2024/10/31/62683808e4800db2a4146edd3a246eb8.png)

![屏幕截图 2024-10-24 124008](https://app.fekepj.com/list-tu/2024/10/31/01047a1f8ea5f74b5c5f381ade090293.png)

![屏幕截图 2024-10-24 124022](G:/%E5%9B%BE%E7%89%87/%E7%94%B5%E8%84%91%E6%88%AA%E5%9B%BE/1024/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-24%20124022.png)

![屏幕截图 2024-10-24 124037](https://app.fekepj.com/list-tu/2024/10/31/ecdcf7afb009e132cedb613540c25734.png)

![屏幕截图 2024-10-24 124146](https://app.fekepj.com/list-tu/2024/10/31/e1a6517a19008551690275d707334012.png)

![屏幕截图 2024-10-24 124259](https://app.fekepj.com/list-tu/2024/10/31/1e97496fabf1eec2696e9a1d0fc729f2.png)

![屏幕截图 2024-10-24 124345](https://app.fekepj.com/list-tu/2024/10/31/c58344624f5ee50d4598db49dd338ad4.png)

![屏幕截图 2024-10-24 124442](https://app.fekepj.com/list-tu/2024/10/31/813e8e250bbdf98e7348d206739038ba.png)

![屏幕截图 2024-10-24 124536](https://app.fekepj.com/list-tu/2024/10/31/3ff593daf98311a1e9d4f464e309594a.png)

![屏幕截图 2024-10-24 171928](https://app.fekepj.com/list-tu/2024/10/31/bc1aa34b03f3f08419b4f0365eabdd1a.png)

应该就可以了，我是可以了，但不知道有没漏截图的！呵呵
