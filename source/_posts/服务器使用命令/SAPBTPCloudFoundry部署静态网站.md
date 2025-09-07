---
title: SAP BTP Cloud Foundry 部署静态网站
categories:
  - 服务器使用命令
date: 2025-08-25 12:24:42
tags:
---

# 在 SAP BTP Cloud Foundry 部署静态网站（以“上院李村庄查询系统”为例）

很多朋友拿到 SAP BTP 的 Trial 账号后，都希望把自己的前端网页部署到云端，供别人访问。这里介绍一个最简单、最稳定的方法 —— 使用 **Staticfile Buildpack** 来托管纯静态网站。

---

## 一、准备工作

- 一个 SAP BTP trial 账号（Cloud Foundry 环境）  
- 一个前端页面文件，比如 `index.html`  
- 一个空白文件 `Staticfile`（注意大小写，必须是这个名字）  

项目目录结构如下：

```text
shy/
 ├── index.html      ← 你的网站主页
 └── Staticfile      ← 告诉 Cloud Foundry 使用 staticfile_buildpack
```

📌 **提示**：`Staticfile` 文件可以为空，它只是告诉 CF 使用静态文件 buildpack。

---

## 二、打包成 zip

将 `shy/` 目录压缩为 `shy.zip`。

⚠️ 注意：不要多一层目录，`shy.zip` 文件里要直接包含 `index.html` 和 `Staticfile`。

---

## 三、部署到 SAP BTP

有两种方式：

### 方法一：BTP Cockpit 网页上传（最简单）

1. 登录 **SAP BTP Cockpit**  
2. 进入你的 **子账户 → Cloud Foundry → 空间（Space）**  
3. 点击 **部署应用** → 上传 `shy.zip`  
4. 在内存和磁盘配置里填：  
   - 内存：`256M`  
   - 磁盘：`256M`  
5. 点击 **部署**，完成后系统会生成一个访问地址，比如：

```
https://shy.cfapps.us10-001.hana.ondemand.com
```

在浏览器中打开，即可访问你的网站。

---

### 方法二：使用 cf CLI 部署（推荐）

1. 安装 [Cloud Foundry CLI](https://github.com/cloudfoundry/cli)  
   - Windows 用户可下载 `.exe` 安装包  
   - macOS/Linux 可通过 `brew` 或 `apt` 安装  

2. 登录 Cloud Foundry  
   ```bash
   cf login -a https://api.cf.us10.hana.ondemand.com
   ```
   按提示输入邮箱、密码、Org 和 Space。

3. 切换到项目目录  
   ```bash
   cd shy
   ```

4. 执行部署命令  
   ```bash
   cf push shy -b staticfile_buildpack -m 256M -k 256M
   ```

   - `-b staticfile_buildpack` 指定使用静态文件 buildpack  
   - `-m 256M` 设置内存  
   - `-k 256M` 设置磁盘空间  

5. 部署完成后，cf CLI 会输出访问 URL，例如：

```
routes:
  shy.cfapps.us10-001.hana.ondemand.com
```

在浏览器中访问该地址，即可看到你的网站。

---

✅ 至此，你的静态网页已经成功部署到 **SAP BTP Cloud Foundry**！

💡 如果你的网站包含多个 HTML 页面或静态资源（CSS/JS/图片），只需一并放进 `shy/` 目录再打包即可。

