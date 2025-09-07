---
layout: openwrt
title: OpenWrt上LAN-to-go自动启动最终方案
date: 2025-09-02 14:39:00
tags:
---

# OpenWrt 上 LAN-to-go 自动启动最终方案

在 OpenWrt 上，最稳妥的方式是**在启动脚本里先切换到程序目录，再使用 `nohup` 后台运行**，并将日志重定向到文件。使用这个方案可以保证 LAN-to-go 在开机时自动启动，并正常生成日志。

## 使用 rc.local

编辑 `/etc/rc.local`，内容示例：

```sh
#!/bin/sh
# Put your custom commands here that should be executed once
# the system init finished.
# 延迟启动 10 秒，防止被系统清理
cd /root
setsid /root/lan-to-go-openwrt-armv7-fixed > /root/lan-to-go.log 2>&1 &
exit 0
```

后来我搬到一个目录lan-to-go内可以这样
```
# Put your custom commands here that should be executed once
# the system init finished. By default this file does nothing.
#!/bin/sh
# 延迟启动 10 秒，防止被系统清理
cd /root/lan-to-go
setsid /root/lan-to-go/lan-to-go-openwrt-armv7-fixed > /root/lan-to-go/lan-to-go.log 2>&1 &
exit 0

```
## 使用 init.d 脚本

创建或编辑 `/etc/init.d/lan-to-go`，示例内容如下：

```sh
#!/bin/sh /etc/rc.common
START=99
STOP=10

start() {
    echo "🚀 启动 LAN-to-go..."
    cd /root
    nohup ./lan-to-go-openwrt-armv7-fixed > /root/lan-to-go.log 2>&1 &
}

stop() {
    echo "🛑 停止 LAN-to-go..."
    pkill -f lan-to-go-openwrt-armv7-fixed
}
```

然后执行以下命令启用自启并立即启动：

```sh
/etc/init.d/lan-to-go enable   # 开机自启
/etc/init.d/lan-to-go start    # 立即启动
```

## 关键点

1. **cd /root**：确保程序运行时工作目录正确，否则会找不到 `templates/*` 导致启动失败。
2. **nohup ... &**：保证程序在后台运行，不会因为 shell 退出而停止。
3. **日志重定向**：`> /root/lan-to-go.log 2>&1` 可以把输出和错误日志都保存下来，方便调试。
4. **停止程序**：`pkill -f lan-to-go-openwrt-armv7-fixed` 可以通过 init.d stop 或手动命令停止。

## 日志查看

实时查看启动日志：

```sh
tail -f /root/lan-to-go.log
```

查看最近日志内容：

```sh
cat /root/lan-to-go.log
```

> 使用这个方案，LAN-to-go 可以在开机时自动启动，同时日志也能正常记录，稳定可靠。
