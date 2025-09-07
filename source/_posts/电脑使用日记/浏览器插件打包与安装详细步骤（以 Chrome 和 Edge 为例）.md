---
title: 浏览器插件打包与安装详细步骤（以 Chrome 和 Edge 为例）
categories:
  - 电脑使用日记
tags:
  - 网页代码
  - 谷歌安装
date: 2024-11-14 18:12:07
---

# 浏览器插件打包与安装详细步骤（以 Chrome 和 Edge 为例） 

本教程详细介绍如何在 Google Chrome 和 Microsoft Edge 之间打包与安装插件。请在实际操作中，将示例路径替换为您自己的用户名、浏览器版本和插件安装位置。


---


#### 示例假设 

- **用户电脑的用户名** ：`Administrator`

- **Chrome 版本** ：`Google Chrome Dev`

- **Edge 版本** ：`Microsoft Edge`

- **插件安装路径** ： 
  - Chrome 插件路径：`C:\Users\Administrator\AppData\Local\Google\Chrome Dev\User Data\Default\Extensions`

  - Edge 插件路径：`C:\Users\Administrator\AppData\Local\Microsoft\Edge\User Data\Default\Extensions`


---


### 一、在 Chrome 中打包插件 

#### 1. 找到 Chrome 插件目录 

插件存放在如下路径中，找到对应插件 ID 的文件夹：


```plaintext
C:\Users\Administrator\AppData\Local\Google\Chrome Dev\User Data\Default\Extensions
```
进入后，插件 ID 文件夹（如 `adghjpdmpbcmppeafpodcjpagmegdpci`）下包含一个**版本号文件夹** ，例如 `0.0.21_0`。**实际的插件内容在版本号文件夹内** ，因此，打包时必须选中版本号文件夹。
#### 2. 进入 Chrome 扩展程序页面 
打开 Chrome 浏览器，在地址栏输入 `chrome://extensions`，并按下回车进入扩展程序管理页面。
#### 3. 启用“开发者模式” 

在页面右上角启用“开发者模式”。

#### 4. 打包插件 

- 点击页面中的“打包扩展程序”按钮。

- 在弹出的窗口中，将目录选择至**版本号文件夹** ，例如：

```plaintext
C:\Users\Administrator\AppData\Local\Google\Chrome Dev\User Data\Default\Extensions\adghjpdmpbcmppeafpodcjpagmegdpci\0.0.21_0
```

- 确保路径精确到版本号文件夹后，点击“打包扩展程序”按钮。
Chrome 会生成 `.crx` 文件（插件包）和 `.pem` 文件（密钥文件）。

---


### 二、在 Edge 中安装打包的 Chrome 插件 

#### 1. 打开 Edge 扩展程序页面 
打开 Edge 浏览器，在地址栏输入 `edge://extensions` 并按下回车，进入扩展程序管理页面。
#### 2. 启用“开发者模式” 

在页面下方启用“开发者模式”。

#### 3. 安装 Chrome 插件包 
将刚打包的 `.crx` 文件直接拖入 Edge 的扩展程序页面，Edge 会自动识别并安装插件。

---


### 三、在 Edge 中打包插件 

#### 1. 找到 Edge 插件目录 

Edge 插件的安装路径为：


```plaintext
C:\Users\Administrator\AppData\Local\Microsoft\Edge\User Data\Default\Extensions
```
找到对应插件 ID 的文件夹（例如 `adghjpdmpbcmppeafpodcjpagmegdpci`）并进入版本号文件夹（如 `0.0.21_0`）来打包插件。
#### 2. 进入 Edge 扩展程序页面 
打开 Edge 浏览器，在地址栏输入 `edge://extensions` 并进入扩展程序管理页面。
#### 3. 启用“开发者模式”并打包插件 
在“开发者模式”启用状态下，点击“打包扩展程序”按钮。选择插件的版本号文件夹，然后 Edge 会生成 `.crx` 和 `.pem` 文件。

---


### 四、在 Chrome 中安装 Edge 打包的插件 

1. **打开 Chrome 扩展程序页面** 
在 Chrome 中输入 `chrome://extensions` 并按下回车。

2. **启用“开发者模式”** 
右上角启用“开发者模式”。

3. **安装插件包** 
将打包好的 `.crx` 文件拖入 Chrome 浏览器，即可完成安装。


---


### 注意事项 

- **路径选择** ：必须选择插件的**版本号文件夹** ，而不是上一级的插件 ID 文件夹。

- **启用开发者模式** ：在 Chrome 和 Edge 中安装打包的 `.crx` 文件时，需启用“开发者模式”。

通过以上步骤，您可以在 Chrome 和 Edge 之间互相打包与安装插件。