---
title: Go语言新手安装与运行教程
categories:
  - 电脑使用日记
date: 2025-09-02 17:28:52
tags:
---

# Go 语言新手安装与运行教程（Windows + 路由器示例）

本文详细说明如何在 Windows 电脑上安装 Go、运行 Go 代码、生成可执行文件（exe），以及如何在局域网内的路由器或设备上使用。

---

## 1️⃣ 安装 Go 语言

1. 打开 [Go 官方网站](https://golang.org/dl/) 下载适合 Windows 的安装包（`.msi`）。
2. 双击安装，保持默认路径即可（通常是 `C:\Go`）。
3. 配置环境变量：
   - 右键“此电脑” → 属性 → 高级系统设置 → 环境变量
   - 在系统变量 `Path` 中添加：`C:\Go\bin`
4. 验证安装：
   ```cmd
go version
```
   输出类似：
   ```
go version go1.21.1 windows/amd64
```

---

## 2️⃣ 创建 Go 项目

1. 在桌面创建一个文件夹，比如：
   ```
   D:\win10桌面内容\桌面\lan-share-file
   ```
2. 在该文件夹中创建 `main.go` 文件，并写入你的 Go 代码。
3. 代码示例：
   ```go
package main

import (
    "fmt"
    "net/http"
    "github.com/gin-gonic/gin"
)

func main() {
    r := gin.Default()
    r.Static("/static", "./static")
    r.GET("/", func(c *gin.Context) {
        c.String(http.StatusOK, "Hello, LAN Share!")
    })
    fmt.Println("Server started at http://localhost:9405")
    r.Run(":9405") // 监听 9405 端口
}
```

> **说明：**  
> - `r.Run(":9405")` 表示在电脑端口 `9405` 启动服务  
> - `r.Static` 用于静态文件服务  

---

## 3️⃣ 安装依赖包

在项目目录打开命令行，执行：

```cmd
go mod init lan-share
go get github.com/gin-gonic/gin
go get github.com/gorilla/websocket
go get github.com/skip2/go-qrcode
```

> **说明：**  
> - `go mod init lan-share`：初始化模块  
> - `go get xxx`：下载依赖  

---

## 4️⃣ 生成 exe 可执行文件

在项目目录执行：

```cmd
go build -o lan-share.exe main.go
```

> **说明：**  
> - `-o lan-share.exe`：指定生成的文件名  
> - `main.go`：要编译的源码  
> - 执行成功后，会在目录生成 `lan-share.exe`  

测试运行：

```cmd
lan-share.exe
```

如果出现以下提示，说明程序已经运行：

```
[GIN-debug] Running in "debug" mode.
Server started at http://localhost:9405
```

> ⚠️ 如果出现模板报错：  
> ```
panic: template: index.html:7: function "url_for" not defined
```
> 说明模板中有 Python 风格的 `url_for`，需要修改为静态路径，例如：
> ```html
<script src="/static/app.js"></script>
```
> 或者在 Go 中注册模板函数：
> ```go
r.SetFuncMap(template.FuncMap{
    "url_for": func(path string) string { return path },
})
```

---

## 5️⃣ 在局域网使用

### 电脑端访问

假设电脑 IP 是 `192.168.1.100`，在局域网的其他设备（手机、路由器等）访问：

```
http://192.168.1.100:9405
```

### 路由器（玩客云）示例

1. 玩客云或路由器支持 Docker / Linux 下运行 Go 二进制文件。
2. 将 `lan-share.exe` 放入路由器的存储（或通过 `scp` 上传）。
3. 在路由器终端运行：
   ```bash
chmod +x lan-share.exe
./lan-share.exe
```
4. 同样在局域网内访问：
   ```
http://<路由器IP>:9405
```

> ⚠️ 注意：
> - 路由器可能是 ARM 架构，需要交叉编译：
>   ```bash
> SET GOARCH=arm
> SET GOOS=linux
> go build -o lan-share-arm main.go
> ```
> - Windows 生成的 exe 只能在 Windows 上运行。

---

## 6️⃣ 常用命令总结

| 命令 | 作用 |
|------|------|
| `go version` | 查看 Go 版本 |
| `go mod init <name>` | 初始化项目模块 |
| `go get <包名>` | 安装依赖包 |
| `go build -o <文件名>` | 生成可执行文件 |
| `./<文件名>` 或 `lan-share.exe` | 运行程序 |
| `SET GOARCH=arm` | 设置交叉编译架构（ARM） |
| `SET GOOS=linux` | 设置交叉编译操作系统（Linux） |

---

## 7️⃣ 常见问题

1. **运行闪退 / 无法在你的电脑上运行**  
   - 确认 exe 是针对你系统架构编译（x64 Windows 或 ARM Linux）  
   - 如果报模板函数未定义，参考第 4️⃣ 步修改模板  

2. **局域网访问不了**  
   - 检查防火墙是否允许端口访问  
   - 确认电脑或路由器 IP 正确  

3. **依赖包报错**  
   - 使用 `go mod tidy` 清理和下载依赖  

---

## 8️⃣ 小结

通过以上步骤，你可以：

- 在 Windows 安装 Go 并运行 Go 程序
- 编译生成 exe 可执行文件
- 在局域网内其他设备访问服务
- 可将程序部署到路由器 / 玩客云等设备上

以后开发新的 Go 项目，流程类似：**写代码 → 安装依赖 → 编译 → 测试 → 部署**

